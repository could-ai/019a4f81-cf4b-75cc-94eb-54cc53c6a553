import 'package:flutter/material.dart';
import 'dart:math';

class DailyQuote extends StatelessWidget {
  const DailyQuote({super.key});

  @override
  Widget build(BuildContext context) {
    final quotes = [
      'البركة في أول النهار يا فؤاد 🌤️',
      'اللهم صل على محمد وعلى آل محمد 🌙',
      'الحمد لله رب العالمين 🙏',
      'سبحان الله وبحمده سبحان الله العظيم',
      'لا إله إلا الله محمد رسول الله',
    ];
    
    final random = Random(DateTime.now().day);
    final dailyQuote = quotes[random.nextInt(quotes.length)];

    return Card(
      color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          dailyQuote,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}