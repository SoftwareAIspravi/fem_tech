import 'package:flutter/material.dart';
import 'package:fem2_app/features/news/widgets/news_card.dart';
import 'package:fem2_app/features/news/screens/news_detail_screen.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      'Всі новини',
      'Здоров\'я',
      'Психологія',
      'Кар\'єра',
      'Спорт',
      'Краса',
    ];

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Новини'),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Theme.of(context).colorScheme.primary,
            tabs: categories.map((e) => Tab(text: e)).toList(),
          ),
          actions: [
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () => _showFilterDialog(context),
            ),
          ],
        ),
        body: TabBarView(
          children: categories.map((category) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 10,
              itemBuilder: (context, index) {
                final newsItem = {
                  'title': '$category: Новина ${index + 1}',
                  'description': 'Детальний опис новини...',
                  'imageUrl': 'https://picsum.photos/seed/$category$index/800/400',
                  'date': DateTime.now().subtract(Duration(days: index)),
                };
                
                return NewsCard(
                  title: newsItem['title'] as String,
                  description: newsItem['description'] as String,
                  imageUrl: newsItem['imageUrl'] as String,
                  date: newsItem['date'] as DateTime,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => NewsDetailScreen(
                        title: newsItem['title'] as String,
                        description: newsItem['description'] as String,
                        imageUrl: newsItem['imageUrl'] as String,
                        date: newsItem['date'] as DateTime,
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Фільтрувати за:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: [
                'Останній місяць',
                'Останній тиждень',
                'Сьогодні',
                'Популярні',
                'Найновіші'
              ].map((filter) => FilterChip(
                label: Text(filter),
                onSelected: (_) => Navigator.pop(context),
                selected: false,
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
