import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الإعدادات'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('الخصوصية'),
            subtitle: const Text('التطبيق خاص بفؤاد فقط'),
            leading: const Icon(Icons.lock),
          ),
          ListTile(
            title: const Text('الإشعارات'),
            subtitle: const Text('إدارة الإشعارات الذكية'),
            leading: const Icon(Icons.notifications),
            onTap: () => _showNotificationsDialog(context),
          ),
          ListTile(
            title: const Text('الصوت'),
            subtitle: const Text('تشغيل الأصوات التأملية'),
            leading: const Icon(Icons.volume_up),
            onTap: () => _showSoundDialog(context),
          ),
          ListTile(
            title: const Text('حفظ البيانات'),
            subtitle: const Text('سيتم حفظ البيانات في السحابة'),
            leading: const Icon(Icons.cloud),
          ),
          const Divider(),
          ListTile(
            title: const Text('حول التطبيق'),
            subtitle: const Text('Fouad – حياتي بتنظيم'),
            leading: const Icon(Icons.info),
          ),
        ],
      ),
    );
  }

  void _showNotificationsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('الإشعارات'),
        content: const Text('سيتم تطبيق الإشعارات الذكية مع Firebase Cloud Messaging.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('موافق'),
          ),
        ],
      ),
    );
  }

  void _showSoundDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('الصوت'),
        content: const Text('سيتم تطبيق الأصوات التأملية قريبًا.'),
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