import 'package:fem2_app/features/events/screens/events_catalog_screen.dart';
import 'package:fem2_app/features/grants/screens/grants_catalog_screen.dart';
import 'package:flutter/material.dart';

class NGODashboardScreen extends StatelessWidget {
  const NGODashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Панель керування'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          _DashboardCard(
            icon: Icons.event,
            title: 'Мої заходи',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const EventsCatalogScreen(isNGO: true),
                ),
              );
            },
          ),
          _DashboardCard(
            icon: Icons.monetization_on,
            title: 'Гранти',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const GrantsCatalogScreen(),
                ),
              );
            },
          ),
          _DashboardCard(
            icon: Icons.analytics,
            title: 'Статистика',
            onTap: () {},
          ),
          _DashboardCard(
            icon: Icons.settings,
            title: 'Налаштування',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _DashboardCard({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48),
            const SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }
}
