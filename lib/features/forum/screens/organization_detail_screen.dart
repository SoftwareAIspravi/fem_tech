import 'package:flutter/material.dart';

class OrganizationDetailScreen extends StatelessWidget {
  final String name;
  final String category;

  const OrganizationDetailScreen({
    super.key, 
    required this.name,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: Icon(
              category.contains('Громадські') 
                ? Icons.groups 
                : Icons.volunteer_activism,
              size: 64,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            name,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Категорія: $category',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          const Text(
            'Про організацію',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Тут буде детальний опис організації, її місія, цілі та основні напрямки діяльності...',
          ),
          const SizedBox(height: 24),
          const Text(
            'Контакти',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('+380 (XX) XXX-XX-XX'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('email@organization.com'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('www.organization.com'),
            onTap: () {},
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.chat),
            label: const Text('Зв\'язатися'),
          ),
        ],
      ),
    );
  }
}
