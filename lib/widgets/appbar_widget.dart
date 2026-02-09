import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String label;
  const AppbarWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(label, style: TextStyle(fontWeight: FontWeight.w600)),
      actions: [
        PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: 'New playlist',
                child: Text('New playlist'),
              ),

              const PopupMenuItem(
                value: 'New Album',
                child: Text('New Album')
              ),

              const PopupMenuItem(
                value: 'Share Playlist',
                child: Text('Share Playlist')
              ),

              const PopupMenuItem(
                value: 'Share Album',
                child: Text('Share Album')
              ),
            ];
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
