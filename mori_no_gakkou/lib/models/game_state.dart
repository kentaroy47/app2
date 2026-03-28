import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'character.dart';

class GameState extends ChangeNotifier {
  Set<String> _unlockedCharacters = {};
  int _katakanaStars = 0;
  int _clockStars = 0;

  Set<String> get unlockedCharacters => _unlockedCharacters;
  int get katakanaStars => _katakanaStars;
  int get clockStars => _clockStars;
  int get totalStars => _katakanaStars + _clockStars;

  List<Character> get collectedCharacters =>
      allCharacters.where((c) => _unlockedCharacters.contains(c.id)).toList();

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    _unlockedCharacters = Set<String>.from(prefs.getStringList('unlocked') ?? []);
    _katakanaStars = prefs.getInt('katakanaStars') ?? 0;
    _clockStars = prefs.getInt('clockStars') ?? 0;
    notifyListeners();
  }

  Future<void> addKatakanaStars(int count) async {
    _katakanaStars += count;
    await _save();
    await _checkUnlock();
    notifyListeners();
  }

  Future<void> addClockStars(int count) async {
    _clockStars += count;
    await _save();
    await _checkUnlock();
    notifyListeners();
  }

  Future<void> _checkUnlock() async {
    // かたかなゲームでアンロック対象のキャラを星の数に応じて解放
    final katakanaChars = allCharacters
        .where((c) => c.unlockHint == 'かたかなゲーム')
        .toList();
    final clockChars = allCharacters
        .where((c) => c.unlockHint == 'とけいゲーム')
        .toList();

    // かたかなゲーム: 50匹ポケモン + 2どうぶつの森 = 52キャラ
    // とけいゲーム:   50匹ポケモン + 2どうぶつの森 = 52キャラ
    // 3スタートで4ずつ増加（52個）
    final katakanaUnlockThresholds = List.generate(52, (i) => 3 + i * 4);
    final clockUnlockThresholds    = List.generate(52, (i) => 3 + i * 4);

    for (int i = 0; i < katakanaChars.length; i++) {
      if (i < katakanaUnlockThresholds.length &&
          _katakanaStars >= katakanaUnlockThresholds[i]) {
        _unlockedCharacters.add(katakanaChars[i].id);
      }
    }
    for (int i = 0; i < clockChars.length; i++) {
      if (i < clockUnlockThresholds.length &&
          _clockStars >= clockUnlockThresholds[i]) {
        _unlockedCharacters.add(clockChars[i].id);
      }
    }
    await _save();
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('unlocked', _unlockedCharacters.toList());
    await prefs.setInt('katakanaStars', _katakanaStars);
    await prefs.setInt('clockStars', _clockStars);
  }

  // デバッグ用リセット
  Future<void> reset() async {
    _unlockedCharacters = {};
    _katakanaStars = 0;
    _clockStars = 0;
    await _save();
    notifyListeners();
  }
}
