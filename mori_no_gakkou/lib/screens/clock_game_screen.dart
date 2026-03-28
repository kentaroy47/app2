import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_state.dart';
import '../widgets/result_overlay.dart';

class ClockGameScreen extends StatefulWidget {
  const ClockGameScreen({super.key});

  @override
  State<ClockGameScreen> createState() => _ClockGameScreenState();
}

class _ClockGameScreenState extends State<ClockGameScreen>
    with SingleTickerProviderStateMixin {
  final _random = Random();
  late int _hour;
  late int _minute;
  late List<String> _choices;
  int _score = 0;
  int _questionCount = 0;
  static const int _totalQuestions = 10;
  String? _selectedAnswer;
  bool _answered = false;
  bool _showResult = false;

  late AnimationController _clockAnim;
  late Animation<double> _scaleAnim;

  int get _level => (_score ~/ 3).clamp(0, 2);

  @override
  void initState() {
    super.initState();
    _clockAnim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _scaleAnim = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: _clockAnim, curve: Curves.elasticOut),
    );
    _nextQuestion();
  }

  @override
  void dispose() {
    _clockAnim.dispose();
    super.dispose();
  }

  void _nextQuestion() {
    setState(() {
      _selectedAnswer = null;
      _answered = false;

      _hour = _random.nextInt(12) + 1;
      if (_level == 0) {
        _minute = 0;
      } else if (_level == 1) {
        _minute = [0, 30][_random.nextInt(2)];
      } else {
        _minute = [0, 15, 30, 45][_random.nextInt(4)];
      }

      final correctAnswer = _timeToString(_hour, _minute);
      final wrongs = <String>{};
      while (wrongs.length < 3) {
        final wh = _random.nextInt(12) + 1;
        int wm;
        if (_level == 0) {
          wm = 0;
        } else if (_level == 1) {
          wm = [0, 30][_random.nextInt(2)];
        } else {
          wm = [0, 15, 30, 45][_random.nextInt(4)];
        }
        final w = _timeToString(wh, wm);
        if (w != correctAnswer) wrongs.add(w);
      }
      _choices = [correctAnswer, ...wrongs]..shuffle();
    });
    _clockAnim.forward(from: 0);
  }

  String _timeToString(int h, int m) {
    if (m == 0) return 'ごぜん $h じ ちょうど';
    return 'ごぜん $h じ $m ふん';
  }

  void _onAnswer(String choice) {
    if (_answered) return;
    final correct = choice == _timeToString(_hour, _minute);
    setState(() {
      _selectedAnswer = choice;
      _answered = true;
      if (correct) _score++;
    });

    Future.delayed(const Duration(milliseconds: 1400), () {
      if (!mounted) return;
      setState(() => _questionCount++);
      if (_questionCount >= _totalQuestions) {
        setState(() => _showResult = true);
        context.read<GameState>().addClockStars(_score);
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
        gameType: 'とけい',
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
            colors: [Color(0xFF74B9FF), Color(0xFF54A0FF)],
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
                        'とけいゲーム',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      '${_questionCount + 1} / $_totalQuestions',
                      style: const TextStyle(
                        fontSize: 18,
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
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              const SizedBox(height: 8),
              Text(
                _level == 0
                    ? '「ちょうど」の とけい'
                    : _level == 1
                        ? '「ちょうど」と「はん」'
                        : '15ふん きざみ',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: 14,
                ),
              ),

              const Spacer(),

              // 時計
              ScaleTransition(
                scale: _scaleAnim,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 48),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: _ClockFace(hour: _hour, minute: _minute),
                  ),
                ),
              ),

              const SizedBox(height: 8),
              const Text(
                'なんじ？',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const Spacer(),

              // 選択肢
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: _choices.map((choice) {
                    Color bgColor = Colors.white;
                    Color textColor = const Color(0xFF2D3436);
                    if (_answered) {
                      if (choice == _timeToString(_hour, _minute)) {
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
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(16),
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
                              fontSize: 18,
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

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _ClockFace extends StatelessWidget {
  final int hour;
  final int minute;

  const _ClockFace({required this.hour, required this.minute});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: CustomPaint(
        painter: _ClockPainter(hour: hour, minute: minute),
      ),
    );
  }
}

class _ClockPainter extends CustomPainter {
  final int hour;
  final int minute;

  _ClockPainter({required this.hour, required this.minute});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final bgPaint = Paint()..color = Colors.white;
    canvas.drawCircle(center, radius, bgPaint);

    // 外枠
    final borderPaint = Paint()
      ..color = const Color(0xFF2D3436)
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius - 3, borderPaint);

    // 数字
    final textPainter = TextPainter(textDirection: TextDirection.ltr);
    for (int i = 1; i <= 12; i++) {
      final angle = (i * 30 - 90) * pi / 180;
      final pos = Offset(
        center.dx + (radius - 28) * cos(angle),
        center.dy + (radius - 28) * sin(angle),
      );
      textPainter.text = TextSpan(
        text: '$i',
        style: TextStyle(
          fontSize: radius * 0.18,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF2D3436),
        ),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        pos - Offset(textPainter.width / 2, textPainter.height / 2),
      );
    }

    // 目盛り
    for (int i = 0; i < 60; i++) {
      final angle = i * 6 * pi / 180;
      final inner = i % 5 == 0 ? radius - 18 : radius - 10;
      canvas.drawLine(
        Offset(center.dx + inner * cos(angle), center.dy + inner * sin(angle)),
        Offset(
          center.dx + (radius - 5) * cos(angle),
          center.dy + (radius - 5) * sin(angle),
        ),
        Paint()
          ..color = const Color(0xFF636E72)
          ..strokeWidth = i % 5 == 0 ? 3 : 1,
      );
    }

    // 分針
    final minuteAngle = (minute * 6 - 90) * pi / 180;
    canvas.drawLine(
      center,
      Offset(
        center.dx + (radius - 20) * cos(minuteAngle),
        center.dy + (radius - 20) * sin(minuteAngle),
      ),
      Paint()
        ..color = const Color(0xFF2D3436)
        ..strokeWidth = 5
        ..strokeCap = StrokeCap.round,
    );

    // 時針
    final hourAngle = ((hour % 12 + minute / 60) * 30 - 90) * pi / 180;
    canvas.drawLine(
      center,
      Offset(
        center.dx + (radius * 0.55) * cos(hourAngle),
        center.dy + (radius * 0.55) * sin(hourAngle),
      ),
      Paint()
        ..color = const Color(0xFF2D3436)
        ..strokeWidth = 8
        ..strokeCap = StrokeCap.round,
    );

    // 中心点
    canvas.drawCircle(center, 8, Paint()..color = const Color(0xFFFF6B6B));
  }

  @override
  bool shouldRepaint(_ClockPainter old) =>
      old.hour != hour || old.minute != minute;
}
