import 'package:flutter/material.dart';

class GrantsCatalogScreen extends StatelessWidget {
  const GrantsCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Каталог грантів')),
      body: ListView.builder(
        itemCount: 10, // temporary mock data
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text('Грант ${index + 1}'),
              subtitle: const Text('Опис гранту'),
              trailing: FilledButton(
                onPressed: () {
                  // TODO: Apply for grant
                },
                child: const Text('Подати заявку'),
              ),
            ),
          );
        },
      ),
    );
  }
}
