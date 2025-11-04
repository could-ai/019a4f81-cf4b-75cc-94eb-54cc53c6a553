import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../widgets/time_display.dart';
import '../widgets/daily_quote.dart';
import '../widgets/quick_actions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Play welcome sound on launch
    _playWelcomeSound();
  }

  void _playWelcomeSound() {
    // TODO: Implement welcome sound
    // AudioManager.playWelcomeSound();
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final isDayTime = appProvider.isDayTime;
    
    return Scaffold(
      backgroundColor: isDayTime ? const Color(0xFF3AA6D0) : const Color(0xFF0F1E3B),
      appBar: AppBar(
        title: const Text('مرحباً يا فؤاد'),
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.cog),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                FadeInDown(
                  child: const TimeDisplay(),
                ),
                const SizedBox(height: 20),
                FadeInUp(
                  child: const DailyQuote(),
                ),
                const SizedBox(height: 30),
                FadeInLeft(
                  child: const QuickActions(),
                ),
                const SizedBox(height: 30),
                // Morning/Evening reminder
                FadeInRight(
                  child: _buildReminderCard(context),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'المذكرة',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'النصائح',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'العمر',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: 'التحديات',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              break; // Already on home
            case 1:
              Navigator.pushNamed(context, '/notebook');
              break;
            case 2:
              Navigator.pushNamed(context, '/advice');
              break;
            case 3:
              Navigator.pushNamed(context, '/age_tracker');
              break;
            case 4:
              Navigator.pushNamed(context, '/challenges');
              break;
          }
        },
      ),
    );
  }

  Widget _buildReminderCard(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final isMorning = appProvider.isMorning;
    
    return Card(
      color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              isMorning ? 'تذكير الصباح' : 'تذكير المساء',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            Text(
              isMorning
                  ? 'ابدأ يومك بذكر الله يا فؤاد، فالبركة في السعي.'
                  : 'نام على نية الخير، فالله لا يضيع نية طيبة يا فؤاد 🌙',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}