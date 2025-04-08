import 'package:flutter/material.dart';
import 'package:fem2_app/features/profile/widgets/profile_menu_item.dart';
import 'package:fem2_app/features/auth/screens/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text(
          'Мій профіль',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 50, color: Color(0xFFFF6B81)),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Олена Петренко',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'elena@example.com',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          ProfileMenuItem(
            icon: Icons.person_outline,
            title: 'Особиста інформація',
            onTap: () {},
          ),
          ProfileMenuItem(
            icon: Icons.notifications_outlined,
            title: 'Сповіщення',
            onTap: () {},
          ),
          ProfileMenuItem(
            icon: Icons.security,
            title: 'Безпека',
            onTap: () {},
          ),
          ProfileMenuItem(
            icon: Icons.help_outline,
            title: 'Допомога та підтримка',
            onTap: () {},
          ),
          ProfileMenuItem(
            icon: Icons.info_outline,
            title: 'Про додаток',
            onTap: () {},
          ),
          const Divider(),
          ProfileMenuItem(
            icon: Icons.exit_to_app,
            title: 'Вийти',
            color: Colors.red,
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
