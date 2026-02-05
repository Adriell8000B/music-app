import 'package:flutter/material.dart';
import 'package:music_app/widgets/appbar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(label: "Home"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: "Search songs...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Featured Albums",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Horizontal Playlist Row
            SizedBox(
              height: 200, // Increased slightly to fit text
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => _buildAlbumCard(index),
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemCount: 4,
              ),
            ),

            const SizedBox(height: 24),
            const Text(
              "Recommended for You",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) => ListTile(
                contentPadding: EdgeInsets.zero,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://picsum.photos/200?random=${index + 10}',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text("Song ${index + 1}"),
                subtitle: const Text("Artist Name • 3:45"),
                trailing: IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlbumCard(int index) {
    final imageUrl = 'https://picsum.photos/300?random=$index';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                width: 140,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            const Positioned(
              bottom: 8,
              right: 8,
              child: Icon(
                Icons.play_circle_fill,
                color: Colors.white70,
                size: 30,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          "Playlist ${index + 1}",
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
