import 'package:flutter/material.dart';

void main() {
  runApp(const SocialProfileApp());
}

class SocialProfileApp extends StatelessWidget {
  const SocialProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social ID Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF673AB7),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ProfileDashboard(),
      },
    );
  }
}

class ProfileDashboard extends StatelessWidget {
  const ProfileDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Linked Accounts'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.deepPurpleAccent,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
              const SizedBox(height: 16),
              Text(
                'Jane Doe',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Manage your social identities',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
              const SizedBox(height: 40),
              _buildSocialCard(
                context: context,
                platform: 'Instagram',
                accountId: '@janedoe_ig',
                icon: Icons.camera_alt,
                color: const Color(0xFFE1306C),
                isConnected: true,
              ),
              const SizedBox(height: 16),
              _buildSocialCard(
                context: context,
                platform: 'Facebook',
                accountId: 'Jane Doe',
                icon: Icons.facebook,
                color: const Color(0xFF1877F2),
                isConnected: true,
              ),
              const SizedBox(height: 16),
              _buildSocialCard(
                context: context,
                platform: 'Twitter / X',
                accountId: 'Not connected',
                icon: Icons.alternate_email,
                color: Colors.black87,
                isConnected: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialCard({
    required BuildContext context,
    required String platform,
    required String accountId,
    required IconData icon,
    required Color color,
    required bool isConnected,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.5),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  platform,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  accountId,
                  style: TextStyle(
                    fontSize: 14,
                    color: isConnected ? Colors.grey[700] : Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: isConnected,
            onChanged: (bool value) {},
            activeColor: color,
          ),
        ],
      ),
    );
  }
}
