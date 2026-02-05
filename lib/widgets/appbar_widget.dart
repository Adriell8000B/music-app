import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String label;
  const AppbarWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(label, style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
