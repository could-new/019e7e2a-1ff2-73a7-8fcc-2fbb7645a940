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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const LessonScreen(),
      },
    );
  }
}

class LessonScreen extends StatelessWidget {
  const LessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Statistical Physics',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.primary,
                      theme.colorScheme.tertiary,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.blur_on,
                    size: 80,
                    color: theme.colorScheme.onPrimary.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Magnetic Materials',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildSectionCard(
                        context,
                        title: 'Main Concepts',
                        icon: Icons.lightbulb_outline,
                        color: Colors.amber,
                        content: const [
                          'Paramagnetism',
                          'Ferromagnetism',
                          'Spin systems',
                          'Curie law',
                          'Phase transition',
                        ],
                        isList: false,
                      ),
                      const SizedBox(height: 16),
                      _buildSectionCard(
                        context,
                        title: 'Student Tasks',
                        icon: Icons.assignment_outlined,
                        color: Colors.blue,
                        content: const [
                          'Explain how microscopic spins produce magnetism',
                          'Investigate magnetic ordering',
                          'Discuss temperature dependence of magnetization',
                        ],
                        isList: true,
                      ),
                      const SizedBox(height: 16),
                      _buildSectionCard(
                        context,
                        title: 'Applications',
                        icon: Icons.memory,
                        color: Colors.green,
                        content: const [
                          'Hard drives',
                          'MRI',
                          'Spintronics',
                          'Magnetic sensors',
                        ],
                        isList: false,
                      ),
                      const SizedBox(height: 16),
                      _buildExtensionCard(context),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required List<String> content,
    required bool isList,
  }) {
    final theme = Theme.of(context);
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color),
                ),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (isList)
              ...content.map((item) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check_circle_outline,
                            size: 20, color: theme.colorScheme.primary),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            item,
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ))
            else
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: content
                    .map((item) => Chip(
                          label: Text(item),
                          backgroundColor: theme.colorScheme.surfaceVariant,
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ))
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildExtensionCard(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      color: theme.colorScheme.secondaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.extension,
              color: theme.colorScheme.onSecondaryContainer,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Possible Extension',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSecondaryContainer,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Use the Ising model conceptually to simulate and understand phase transitions and magnetic ordering at a microscopic level.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSecondaryContainer,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
