import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'medicine_scanner_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HealBandhu')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Your healthcare companion',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Access basic health information and useful tools in one place.',
          ),
          const SizedBox(height: 24),
          _FeatureCard(
            icon: Icons.chat_bubble_outline,
            title: 'SwasthyaSathi',
            subtitle: 'Try the demo health-information chat',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ChatScreen()),
            ),
          ),
          _FeatureCard(
            icon: Icons.document_scanner_outlined,
            title: 'Medicine label scanner',
            subtitle: 'Extract text from a medicine-package photo',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const MedicineScannerScreen(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Important: HealBandhu is an informational prototype. '
                'It does not diagnose conditions, prescribe medicines, or '
                'replace a qualified healthcare professional. For urgent '
                'symptoms, seek medical care.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: ListTile(
        leading: CircleAvatar(child: Icon(icon)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
