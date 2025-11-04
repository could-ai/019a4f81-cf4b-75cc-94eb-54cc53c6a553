import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class AgeTrackerScreen extends StatefulWidget {
  const AgeTrackerScreen({super.key});

  @override
  State<AgeTrackerScreen> createState() => _AgeTrackerScreenState();
}

class _AgeTrackerScreenState extends State<AgeTrackerScreen> {
  final TextEditingController _ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    _ageController.text = appProvider.userAge.toString();
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final currentAge = appProvider.userAge;
    final daysLived = (currentAge * 365.25).round(); // Approximate
    final estimatedLifespan = 80; // Example
    final daysRemaining = ((estimatedLifespan - currentAge) * 365.25).round();

    final wisdomQuotes = [
      'العمر رأس مالك يا فؤاد، فلا تهدره فيما لا ينفع ⏳',
      'كل نفس بما كسبت رهينة',
      'والعصر إن الإنسان لفي خسر',
    ];
    final randomQuote = wisdomQuotes[DateTime.now().day % wisdomQuotes.length];

    return Scaffold(
      appBar: AppBar(
        title: const Text('العمر والزمن'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(
                labelText: 'عمرك الحالي',
                hintText: 'أدخل عمرك',
              ),
              keyboardType: TextInputType.number,
              onSubmitted: (value) {
                final age = int.tryParse(value) ?? currentAge;
                appProvider.updateUserAge(age);
              },
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text('الأيام الماضية: $daysLived'),
                    Text('الأيام المتبقية (تقريبي): $daysRemaining'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  randomQuote,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}