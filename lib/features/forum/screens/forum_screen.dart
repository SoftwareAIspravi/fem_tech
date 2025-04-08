import 'package:fem2_app/features/forum/screens/group_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:fem2_app/features/forum/widgets/forum_topic_card.dart';
import 'package:fem2_app/features/forum/models/forum_topic.dart';
import 'package:fem2_app/features/forum/screens/topic_detail_screen.dart';

class ForumScreen extends StatelessWidget {
  const ForumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'title': 'Здоров\'я',
        'icon': Icons.favorite,
        'color': Colors.red,
        'groups': ['Загальне здоров\'я', 'Репродуктивне здоров\'я', 'Харчування']
      },
      {
        'title': 'Психологія',
        'icon': Icons.psychology,
        'color': Colors.purple,
        'groups': ['Особистий розвиток', 'Відносини', 'Материнство']
      },
      // Add more categories...
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Форум'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ExpansionTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  category['icon'] as IconData,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              title: Text(
                category['title'] as String,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              children: [
                ...(category['groups'] as List<String>).map(
                  (group) => ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 8,
                    ),
                    title: Text(group),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => GroupChatScreen(
                          groupName: group,
                          categoryName: category['title'] as String,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showNewTopicDialog(context),
        label: const Text('Нова тема'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  void _showNewTopicDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Створити нову тему'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Назва теми',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Опис',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Скасувати'),
          ),
          FilledButton(
            onPressed: () {
              // TODO: Implement topic creation
              Navigator.pop(context);
            },
            child: const Text('Створити'),
          ),
        ],
      ),
    );
  }
}
