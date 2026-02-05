import 'package:flutter/material.dart';
import 'package:music_app/screens/shell_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color nightBlue = Color(0xFF111722);
    const Color nightBlue_2 = Color(0xFF162032);
    const Color royalBlue = Color(0xFF5271FF);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,

        colorScheme: ColorScheme.fromSeed(
          seedColor: royalBlue,
          brightness: Brightness.dark,
          surface: nightBlue,
        ),
        scaffoldBackgroundColor: nightBlue,

        appBarTheme: AppBarTheme(
          backgroundColor: nightBlue,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
        ),

        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: nightBlue,

          iconTheme: WidgetStateProperty.fromMap({
            WidgetState.selected: const IconThemeData(color: royalBlue),
            WidgetState.any: const IconThemeData(color: Colors.white70),
          }),
          labelTextStyle: WidgetStateProperty.fromMap({
            WidgetState.selected: const TextStyle(color: royalBlue),
            WidgetState.any: const TextStyle(color: Colors.grey),
          }),
          elevation: 0,
          indicatorColor: Colors.black,
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: nightBlue_2,
        ),
      ),
      home: ShellScreen(),
    );
  }
}
