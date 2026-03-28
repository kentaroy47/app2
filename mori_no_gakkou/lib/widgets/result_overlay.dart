import 'package:flutter/material.dart';

class ResultOverlay extends StatelessWidget {
  final int score;
  final int total;
  final String gameType;
  final VoidCallback onRetry;
  final VoidCallback onHome;

  const ResultOverlay({
    super.key,
    required this.score,
    required this.total,
    required this.gameType,
    required this.onRetry,
    required this.onHome,
  });

  String get _message {
    final ratio = score / total;
    if (ratio == 1.0) return 'かんぺき！ すごい！！ 🎉';
    if (ratio >= 0.8) return 'よくできました！ ✨';
    if (ratio >= 0.6) return 'がんばったね！ 😊';
    return 'もういちど やってみよう！ 💪';
  }

  @override
  Widget build(BuildContext context) {
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$gameType ゲーム おわり！',
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 24),

                // スコアカード
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // 星表示
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: List.generate(total, (i) {
                          return Icon(
                            i < score ? Icons.star : Icons.star_border,
                            color: Colors.amber,
                            size: total <= 5 ? 40 : 28,
                          );
                        }),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '$score / $total もん せいかい！',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D3436),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _message,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color(0xFF636E72),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // ボタン
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _RoundButton(
                      icon: Icons.home,
                      label: 'ホームへ',
                      color: const Color(0xFF636E72),
                      onTap: onHome,
                    ),
                    const SizedBox(width: 20),
                    _RoundButton(
                      icon: Icons.refresh,
                      label: 'もういちど',
                      color: const Color(0xFF00B894),
                      onTap: onRetry,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RoundButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _RoundButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.4),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 32),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
