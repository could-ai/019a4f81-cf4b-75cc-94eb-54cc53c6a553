import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildActionCard(
          context,
          'المذكرة',
          FontAwesomeIcons.book,
          () => Navigator.pushNamed(context, '/notebook'),
        ),
        _buildActionCard(
          context,
          'المنبه',
          FontAwesomeIcons.clock,
          () => _showAlarmDialog(context),
        ),
        _buildActionCard(
          context,
          'النصائح',
          FontAwesomeIcons.lightbulb,
          () => Navigator.pushNamed(context, '/advice'),
        ),
        _buildActionCard(
          context,
          'التحديات',
          FontAwesomeIcons.flag,
          () => Navigator.pushNamed(context, '/challenges'),
        ),
      ],
    );
  }

  Widget _buildActionCard(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Card(
      color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(icon, size: 40, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 10),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAlarmDialog(BuildContext context) {
    // TODO: Implement alarm functionality with Android Alarm Manager
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('المنبه'),
        content: const Text('سيتم تطبيق المنبه الذكي قريبًا مع Firebase.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('موافق'),
          ),
        ],
      ),
    );
  }
}