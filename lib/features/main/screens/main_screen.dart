import 'package:flutter/material.dart';
import 'package:fem2_app/features/news/screens/news_screen.dart';
import 'package:fem2_app/features/forum/screens/forum_screen.dart';
import 'package:fem2_app/features/services/screens/services_screen.dart';
import 'package:fem2_app/features/profile/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    NewsScreen(),
    ForumScreen(),
    ServicesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            setState(() => _selectedIndex = index);
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          height: 80,
          destinations: [
            NavigationDestination(
              icon: Icon(
                Icons.newspaper,
                color: _selectedIndex == 0
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
              ),
              label: 'Новини',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.forum,
                color: _selectedIndex == 1
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
              ),
              label: 'Форум',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.medical_services,
                color: _selectedIndex == 2
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
              ),
              label: 'Послуги',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.person,
                color: _selectedIndex == 3
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
              ),
              label: 'Профіль',
            ),
          ],
        ),
      ),
    );
  }
}
