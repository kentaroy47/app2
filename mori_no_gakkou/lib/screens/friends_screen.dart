import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/character.dart';
import '../models/game_state.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameState>();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF6C5CE7), Color(0xFFA29BFE)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // ヘッダー
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Expanded(
                      child: Text(
                        'なかまたち',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      '${state.collectedCharacters.length} / ${allCharacters.length}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // キャラクターグリッド
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: allCharacters.length,
                  itemBuilder: (context, i) {
                    final char = allCharacters[i];
                    final unlocked = state.unlockedCharacters.contains(char.id);
                    return _CharacterCard(character: char, unlocked: unlocked);
                  },
                ),
              ),

              // ヒント
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'ゲームでほしをあつめると なかまが ふえるよ！',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ],
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

class _CharacterCard extends StatelessWidget {
  final Character character;
  final bool unlocked;

  const _CharacterCard({required this.character, required this.unlocked});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: unlocked ? Colors.white : Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
        boxShadow: unlocked
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: unlocked
                ? _CharacterImage(character: character)
                : _LockedImage(character: character),
          ),
          const SizedBox(height: 6),
          Text(
            unlocked ? character.name : '？？？',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: unlocked
                  ? const Color(0xFF2D3436)
                  : Colors.white.withValues(alpha: 0.6),
            ),
          ),
          if (unlocked) ...[
            const SizedBox(height: 2),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: character.type == CharacterType.pokemon
                    ? const Color(0xFFFFD93D)
                    : const Color(0xFF98FB98),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                character.type == CharacterType.pokemon ? 'ポケモン' : 'もり',
                style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _CharacterImage extends StatelessWidget {
  final Character character;
  const _CharacterImage({required this.character});

  @override
  Widget build(BuildContext context) {
    if (character.type == CharacterType.pokemon && character.spriteUrl != null) {
      return Image.network(
        character.spriteUrl!,
        fit: BoxFit.contain,
        loadingBuilder: (ctx, child, progress) {
          if (progress == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
        errorBuilder: (ctx, error, stack) => const Text(
          '🎮',
          style: TextStyle(fontSize: 48),
          textAlign: TextAlign.center,
        ),
      );
    }
    return Text(
      character.emoji ?? '⭐',
      style: const TextStyle(fontSize: 56),
      textAlign: TextAlign.center,
    );
  }
}

class _LockedImage extends StatelessWidget {
  final Character character;
  const _LockedImage({required this.character});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.lock, color: Colors.white, size: 36),
        const SizedBox(height: 4),
        Text(
          character.unlockHint,
          style: const TextStyle(fontSize: 9, color: Colors.white70),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
