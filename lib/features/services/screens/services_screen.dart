import 'package:flutter/material.dart';
import 'package:fem2_app/features/services/screens/service_detail_screen.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {
        'title': 'Консультації',
        'icon': Icons.health_and_safety,
        'color': Colors.blue,
        'description': 'Консультації з лікарями та експертами',
        'specialists': ['Терапевт', 'Гінеколог', 'Ендокринолог']
      },
      {
        'title': 'Психологія',
        'icon': Icons.psychology,
        'color': Colors.purple,
        'description': 'Психологічна підтримка та консультації',
        'specialists': ['Психолог', 'Психотерапевт', 'Сімейний консультант']
      },
      {'title': 'Групи підтримки', 'icon': Icons.groups, 'color': Colors.orange},
      {'title': 'Юридична допомога', 'icon': Icons.gavel, 'color': Colors.green},
      {'title': 'Освітні програми', 'icon': Icons.school, 'color': Colors.red},
      {'title': 'Фітнес та здоров\'я', 'icon': Icons.fitness_center, 'color': Colors.teal},
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Послуги', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  service['icon'] as IconData,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              title: Text(
                service['title'] as String,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(service['description'] as String? ?? ''),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ServiceDetailScreen(
                      title: service['title'] as String,
                      icon: service['icon'] as IconData,
                      color: service['color'] as Color,
                      description: service['description'] as String? ?? '',
                      specialists: service['specialists'] as List<String>? ?? [],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
