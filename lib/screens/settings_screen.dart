import 'package:flutter/material.dart';
import 'package:music_app/widgets/appbar_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isEqualizerEnabled = true;
  bool _isGaplessPlaybackEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(label: 'Settings'),
      body: ListView(
        children: [
          _buildSectionHeader('Account'),
          _buildListTile(Icons.person_outline, 'Profile', 'Edit your info'),
          _buildListTile(
            Icons.subscriptions_outlined,
            'Subscription',
            'Manage your plan',
          ),

          const Divider(color: Colors.white24),
          _buildSectionHeader('Audio & Playback'),
          _buildListTile(
            Icons.high_quality,
            'Audio Quality',
            'Extreme (320kbps)',
          ),
          _buildSwitchTile(Icons.equalizer, 'Equalizer', _isEqualizerEnabled, (
            bool newValue,
          ) {
            setState(() => _isEqualizerEnabled = newValue);
          }),
          _buildSwitchTile(
            Icons.volume_up_outlined,
            'Gapless Playback',
            _isGaplessPlaybackEnabled,
            (bool newValue) {
              setState(() => _isGaplessPlaybackEnabled = newValue);
            },
          ),

          const Divider(color: Colors.white24),
          _buildSectionHeader('Storage & Downloads'),
          _buildListTile(
            Icons.download_for_offline_outlined,
            'Download Location',
            'SD Card',
          ),
          _buildListTile(
            Icons.delete_sweep_outlined,
            'Clear Cache',
            '1.2 GB used',
          ),

          const Divider(color: Colors.white24),
          _buildSectionHeader('Support'),
          _buildListTile(Icons.help_outline, 'Help Center', null),
          _buildListTile(Icons.info_outline, 'About', 'Version 2.4.0'),

          const SizedBox(height: 20),
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text('Log Out', style: TextStyle(color: Colors.red)),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Color(0xFF5271FF),
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, String? subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      subtitle: subtitle != null
          ? Text(subtitle, style: const TextStyle(color: Colors.white70))
          : null,
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.white54,
        size: 20,
      ),
      onTap: () {},
    );
  }

  Widget _buildSwitchTile(
    IconData icon,
    String title,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return SwitchListTile(
      secondary: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      value: value,
      onChanged: onChanged,
      activeThumbColor: Color(0xFF5271FF),
    );
  }
}
