import 'package:fem2_app/features/chat/screens/event_chat_screen.dart';
import 'package:fem2_app/features/events/screens/create_event_screen.dart';
import 'package:flutter/material.dart';
import '../models/event.dart';

class EventsCatalogScreen extends StatelessWidget {
  final bool isNGO;
  
  const EventsCatalogScreen({
    super.key,
    this.isNGO = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Каталог заходів'),
        actions: [
          if (isNGO)
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                // TODO: Navigate to event creation
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CreateEventScreen(),
                  ),
                );
              },
            ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: const Icon(Icons.event, size: 50),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Захід ${index + 1}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Організатор: ГО "Назва"',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 16,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 8),
                          Text('01.01.2024'),
                          const SizedBox(width: 16),
                          Icon(
                            Icons.location_on,
                            size: 16,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 8),
                          Text('Київ'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: FilledButton.icon(
                              onPressed: () {
                                // TODO: Implement registration
                              },
                              icon: const Icon(Icons.person_add),
                              label: const Text('Зареєструватися'),
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton.filled(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => EventChatScreen(eventId: 'event_$index'),
                                ),
                              );
                            },
                            icon: const Icon(Icons.chat),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
