import 'package:flutter/material.dart';
import 'package:music_app/navigation/bottom_navigator.dart';
import 'package:music_app/screens/home_screen.dart';
import 'package:music_app/screens/library_screen.dart';
import 'package:music_app/screens/settings_screen.dart';

class ShellScreen extends StatefulWidget {
  const ShellScreen({super.key});

  @override
  State<ShellScreen> createState() => _ShellScreenState();
}

class _ShellScreenState extends State<ShellScreen> {
  int currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(key: ValueKey(0)),
    const LibraryScreen(key: ValueKey(1)),
    const SettingsScreen(key: ValueKey(2)),
  ];

  void navigate(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavigator(
        currentIndex: currentIndex,
        onTap: navigate,
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 0.02),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
        child: _pages[currentIndex],
      ),
    );
  }
}
