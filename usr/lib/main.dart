import 'package:flutter/material.dart';

void main() {
  runApp(const MagneticMaterialsApp());
}

class MagneticMaterialsApp extends StatelessWidget {
  const MagneticMaterialsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magnetic Materials',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistical Physics of Magnetic Materials'),
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildSectionHeader(context, 'Main Concepts', Icons.lightbulb_outline),
                  _buildCard(
                    context,
                    items: [
                      'Paramagnetism',
                      'Ferromagnetism',
                      'Spin systems',
                      'Curie law',
                      'Phase transition',
                    ],
                    iconColor: Colors.orange,
                    icon: Icons.science,
                  ),
                  const SizedBox(height: 24),
                  _buildSectionHeader(context, 'Student Tasks', Icons.assignment_outlined),
                  _buildCard(
                    context,
                    items: [
                      'Explain how microscopic spins produce magnetism',
                      'Investigate magnetic ordering',
                      'Discuss temperature dependence of magnetization',
                    ],
                    iconColor: Colors.blue,
                    icon: Icons.check_circle_outline,
                  ),
                  const SizedBox(height: 24),
                  _buildSectionHeader(context, 'Applications', Icons.apps_outlined),
                  _buildCard(
                    context,
                    items: [
                      'Hard drives',
                      'MRI',
                      'Spintronics',
                      'Magnetic sensors',
                    ],
                    iconColor: Colors.green,
                    icon: Icons.memory,
                  ),
                  const SizedBox(height: 24),
                  _buildSectionHeader(context, 'Possible Extension', Icons.extension_outlined),
                  _buildCard(
                    context,
                    items: [
                      'Use the Ising model conceptually.',
                    ],
                    iconColor: Colors.purple,
                    icon: Icons.add_circle_outline,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icon, size: 28, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 12),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, {required List<String> items, required Color iconColor, required IconData icon}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(icon, size: 20, color: iconColor),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      item,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.4),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
