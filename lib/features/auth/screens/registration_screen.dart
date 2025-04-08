import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _isNGO = false;
  
  void _handleRegistration() {
    if (_isNGO) {
      Navigator.pushReplacementNamed(context, '/ngo-dashboard');
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Реєстрація')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SegmentedButton<bool>(
            segments: const [
              ButtonSegment(
                value: false,
                label: Text('Користувач'),
              ),
              ButtonSegment(
                value: true,
                label: Text('Громадська організація'),
              ),
            ],
            selected: {_isNGO},
            onSelectionChanged: (Set<bool> value) {
              setState(() => _isNGO = value.first);
            },
          ),
          const SizedBox(height: 24),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Пароль',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          if (_isNGO) ...[
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Назва організації',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'ЄДРПОУ',
                border: OutlineInputBorder(),
              ),
            ),
          ],
          const SizedBox(height: 24),
          FilledButton(
            onPressed: _handleRegistration,
            child: const Text('Зареєструватися'),
          ),
          TextButton(
            onPressed: () {
              // TODO: Navigate to login
            },
            child: const Text('Вже маєте акаунт? Увійти'),
          ),
        ],
      ),
    );
  }
}
