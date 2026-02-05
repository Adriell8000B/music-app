import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class BottomNavigator extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigator({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      indicatorColor: Theme.of(
        context,
      ).colorScheme.primary.withValues(alpha: 0.2),
      destinations: const [
        NavigationDestination(
          icon: Icon(TablerIcons.home),
          selectedIcon: Icon(TablerIcons.home),
          label: 'Home',
        ),
        NavigationDestination(icon: Icon(TablerIcons.album), label: 'Library'),
        NavigationDestination(
          icon: Icon(TablerIcons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
