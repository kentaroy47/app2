import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_state.dart';
import '../widgets/result_overlay.dart';

const List<Map<String, String>> katakanaPairs = [
  {'hira': 'あ', 'kata': 'ア'},
  {'hira': 'い', 'kata': 'イ'},
  {'hira': 'う', 'kata': 'ウ'},
  {'hira': 'え', 'kata': 'エ'},
  {'hira': 'お', 'kata': 'オ'},
  {'hira': 'か', 'kata': 'カ'},
  {'hira': 'き', 'kata': 'キ'},
  {'hira': 'く', 'kata': 'ク'},
  {'hira': 'け', 'kata': 'ケ'},
  {'hira': 'こ', 'kata': 'コ'},
  {'hira': 'さ', 'kata': 'サ'},
  {'hira': 'し', 'kata': 'シ'},
  {'hira': 'す', 'kata': 'ス'},
  {'hira': 'せ', 'kata': 'セ'},
  {'hira': 'そ', 'kata': 'ソ'},
  {'hira': 'た', 'kata': 'タ'},
  {'hira': 'ち', 'kata': 'チ'},
  {'hira': 'つ', 'kata': 'ツ'},
  {'hira': 'て', 'kata': 'テ'},
  {'hira': 'と', 'kata': 'ト'},
  {'hira': 'な', 'kata': 'ナ'},
  {'hira': 'に', 'kata': 'ニ'},
  {'hira': 'ぬ', 'kata': 'ヌ'},
  {'hira': 'ね', 'kata': 'ネ'},
  {'hira': 'の', 'kata': 'ノ'},
  {'hira': 'は', 'kata': 'ハ'},
  {'hira': 'ひ', 'kata': 'ヒ'},
  {'hira': 'ふ', 'kata': 'フ'},
  {'hira': 'へ', 'kata': 'ヘ'},
  {'hira': 'ほ', 'kata': 'ホ'},
  {'hira': 'ま', 'kata': 'マ'},
  {'hira': 'み', 'kata': 'ミ'},
  {'hira': 'む', 'kata': 'ム'},
  {'hira': 'め', 'kata': 'メ'},
  {'hira': 'も', 'kata': 'モ'},
  {'hira': 'や', 'kata': 'ヤ'},
  {'hira': 'ゆ', 'kata': 'ユ'},
  {'hira': 'よ', 'kata': 'ヨ'},
  {'hira': 'ら', 'kata': 'ラ'},
  {'hira': 'り', 'kata': 'リ'},
  {'hira': 'る', 'kata': 'ル'},
  {'hira': 'れ', 'kata': 'レ'},
  {'hira': 'ろ', 'kata': 'ロ'},
  {'hira': 'わ', 'kata': 'ワ'},
  {'hira': 'を', 'kata': 'ヲ'},
  {'hira': 'ん', 'kata': 'ン'},
];

class KatakanaGameScreen extends StatefulWidget {
  const KatakanaGameScreen({super.key});

  @override
  State<KatakanaGameScreen> createState() => _KatakanaGameScreenState();
}

class _KatakanaGameScreenState extends State<KatakanaGameScreen>
    with SingleTickerProviderStateMixin {
  final _random = Random();
  late Map<String, String> _currentPair;
  late List<String> _choices;
  int _score = 0;
  int _questionCount = 0;
  static const int _totalQuestions = 10;
  String? _selectedAnswer;
  bool _answered = false;
  bool _showResult = false;

  late AnimationController _questionAnim;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _questionAnim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _scaleAnim = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _questionAnim, curve: Curves.elasticOut),
    );
    _nextQuestion();
  }

  @override
  void dispose() {
    _questionAnim.dispose();
    super.dispose();
  }

  void _nextQuestion() {
    setState(() {
      _selectedAnswer = null;
      _answered = false;
      _currentPair = katakanaPairs[_random.nextInt(katakanaPairs.length)];

      final wrongChoices = List.of(katakanaPairs)
        ..remove(_currentPair)
        ..shuffle();
      _choices = [
        _currentPair['kata']!,
        wrongChoices[0]['kata']!,
        wrongChoices[1]['kata']!,
        wrongChoices[2]['kata']!,
      ]..shuffle();
    });
    _questionAnim.forward(from: 0);
  }

  void _onAnswer(String choice) {
    if (_answered) return;
    final correct = choice == _currentPair['kata'];
    setState(() {
      _selectedAnswer = choice;
      _answered = true;
      if (correct) _score++;
    });

    Future.delayed(const Duration(milliseconds: 1200), () {
      if (!mounted) return;
      setState(() => _questionCount++);
      if (_questionCount >= _totalQuestions) {
        setState(() => _showResult = true);
        context.read<GameState>().addKatakanaStars(_score);
      } else {
        _nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showResult) {
      return ResultOverlay(
        score: _score,
        total: _totalQuestions,
        gameType: 'かたかな',
        onRetry: () {
          setState(() {
            _score = 0;
            _questionCount = 0;
            _showResult = false;
          });
          _nextQuestion();
        },
        onHome: () => Navigator.pop(context),
      );
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFD93D), Color(0xFFFF9F43)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // ヘッダー
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 16, 4),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Expanded(
                      child: Text(
                        'かたかなゲーム',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      '${_questionCount + 1} / $_totalQuestions',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // 進捗バー
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: List.generate(_totalQuestions, (i) {
                    Color color;
                    if (i < _questionCount) {
                      color = Colors.white;
                    } else if (i == _questionCount) {
                      color = Colors.white.withValues(alpha: 0.5);
                    } else {
                      color = Colors.white.withValues(alpha: 0.2);
                    }
                    return Expanded(
                      child: Container(
                        height: 6,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              const SizedBox(height: 8),

              // 問題カード
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ScaleTransition(
                    scale: _scaleAnim,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 16,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'この もじの かたかなは どれ？',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF636E72),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _currentPair['hira']!,
                            style: const TextStyle(
                              fontSize: 88,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2D3436),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // 選択肢
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.6,
                    children: _choices.map((choice) {
                      Color bgColor = Colors.white;
                      Color textColor = const Color(0xFF2D3436);
                      if (_answered) {
                        if (choice == _currentPair['kata']) {
                          bgColor = const Color(0xFF00B894);
                          textColor = Colors.white;
                        } else if (choice == _selectedAnswer) {
                          bgColor = const Color(0xFFD63031);
                          textColor = Colors.white;
                        }
                      }
                      return GestureDetector(
                        onTap: () => _onAnswer(choice),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              choice,
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
