import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/game_state.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final gameState = GameState();
  await gameState.load();

  runApp(
    ChangeNotifierProvider.value(
      value: gameState,
      child: const MoriNoGakkouApp(),
    ),
  );
}

class MoriNoGakkouApp extends StatelessWidget {
  const MoriNoGakkouApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'もりのがっこう',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00B894)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
