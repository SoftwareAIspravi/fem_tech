import 'package:flutter/material.dart';

class ForumTopicCard extends StatelessWidget {
  final String title;
  final int messageCount;
  final DateTime lastActivity;
  final VoidCallback onTap;

  const ForumTopicCard({
    super.key,
    required this.title,
    required this.messageCount,
    required this.lastActivity,
    required this.onTap, required String description, required String authorName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Icon(
            Icons.forum,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        title: Text(title),
        subtitle: Text('Повідомлень: $messageCount'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Остання активність:',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              '${lastActivity.hour}:${lastActivity.minute}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
