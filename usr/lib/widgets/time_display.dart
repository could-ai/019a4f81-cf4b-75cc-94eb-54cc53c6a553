import 'package:flutter/material.dart';
import '../widgets/time_display.dart';

class TimeDisplay extends StatelessWidget {
  const TimeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final hijri = HijriCalendar.fromDate(now);
    
    return Column(
      children: [
        Text(
          DateFormat('HH:mm').format(now),
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontSize: 48,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          DateFormat('EEEE, d MMMM y', 'ar').format(now),
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Colors.white70,
          ),
        ),
        Text(
          '${hijri.hDay} ${hijri.getLongMonthName()} ${hijri.hYear}',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}