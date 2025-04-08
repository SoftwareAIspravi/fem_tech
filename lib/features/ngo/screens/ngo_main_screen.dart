import 'package:fem2_app/features/ngo/screens/ngo_profile_screen.dart';
import 'package:flutter/material.dart';
import '../../events/screens/events_catalog_screen.dart';
import '../../grants/screens/grants_catalog_screen.dart';
import '../../profile/screens/profile_screen.dart';

class NGOMainScreen extends StatefulWidget {
  const NGOMainScreen({super.key});

  @override
  State<NGOMainScreen> createState() => _NGOMainScreenState();
}

class _NGOMainScreenState extends State<NGOMainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    EventsCatalogScreen(isNGO: true),
    GrantsCatalogScreen(),
    NGOProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.event),
            label: 'Мої заходи',
          ),
          NavigationDestination(
            icon: Icon(Icons.monetization_on),
            label: 'Гранти',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_balance),
            label: 'Організація',
          ),
        ],
      ),
    );
  }
}
