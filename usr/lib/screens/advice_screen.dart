import 'package:flutter/material.dart';

class AdviceScreen extends StatelessWidget {
  const AdviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final adviceList = [
      {
        'title': 'كيف تربح المال بالحلال',
        'content': 'الكسب الحلال هو الأساس للبركة في المال. ابحث عن فرص عمل شرعية واستثمر وقتك في تعلم مهارات جديدة.',
      },
      {
        'title': 'كيف تستثمر وقتك',
        'content': 'الوقت أغلى من المال. قسم يومك بين العبادة، العمل، والراحة. استخدم التطبيق لتتبع أهدافك.',
      },
      {
        'title': 'كيف تعيش برضا وهدوء',
        'content': 'الرضا بالقضاء هو مفتاح السعادة. صلِ الخمس، اذكر الله، ولا تطمع فيما عند الآخرين.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('نصائح الحياة الإسلامية'),
      ),
      body: ListView.builder(
        itemCount: adviceList.length,
        itemBuilder: (context, index) {
          final advice = adviceList[index];
          return Card(
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    advice['title']!,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    advice['content']!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}