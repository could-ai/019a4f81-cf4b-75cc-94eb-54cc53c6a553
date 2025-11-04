import 'package:flutter/material.dart';

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  @override
  State<ChallengesScreen> createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends State<ChallengesScreen> {
  final List<Map<String, dynamic>> _challenges = [
    {
      'title': 'تحدي قراءة سورة الكهف',
      'description': 'اقرأ سورة الكهف كل يوم جمعة',
      'duration': 7,
      'progress': 0,
    },
    {
      'title': 'تحدي الاستيقاظ باكرًا',
      'description': 'استيقظ قبل الفجر 7 أيام متتالية',
      'duration': 7,
      'progress': 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تحديات الأسبوع'),
      ),
      body: ListView.builder(
        itemCount: _challenges.length,
        itemBuilder: (context, index) {
          final challenge = _challenges[index];
          return Card(
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    challenge['title'],
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 10),
                  Text(challenge['description']),
                  const SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: challenge['progress'] / challenge['duration'],
                  ),
                  const SizedBox(height: 10),
                  Text('التقدم: ${challenge['progress']}/${challenge['duration']}'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () => _updateProgress(index),
                        child: const Text('تحديث'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _updateProgress(int index) {
    setState(() {
      if (_challenges[index]['progress'] < _challenges[index]['duration']) {
        _challenges[index]['progress']++;
      }
    });
    // TODO: Save progress to Firebase
  }
}