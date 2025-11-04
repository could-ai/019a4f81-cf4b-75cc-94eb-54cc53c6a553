import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_screen.dart';
import 'screens/notebook_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/advice_screen.dart';
import 'screens/age_tracker_screen.dart';
import 'screens/challenges_screen.dart';
import 'providers/app_provider.dart';
import 'utils/audio_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize audio manager
  await AudioManager.initialize();
  
  // Load preferences
  final prefs = await SharedPreferences.getInstance();
  final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
  final userAge = prefs.getInt('userAge') ?? 25; // Default age
  
  runApp(MyApp(
    isFirstLaunch: isFirstLaunch,
    userAge: userAge,
  ));
}

class MyApp extends StatelessWidget {
  final bool isFirstLaunch;
  final int userAge;
  
  const MyApp({
    super.key,
    required this.isFirstLaunch,
    required this.userAge,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppProvider(isFirstLaunch: isFirstLaunch, userAge: userAge),
        ),
      ],
      child: MaterialApp(
        title: 'Fouad – حياتي بتنظيم',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Cairo',
          primaryColor: const Color(0xFF3AA6D0), // Morning blue
          scaffoldBackgroundColor: const Color(0xFF0F1E3B), // Night blue
          colorScheme: const ColorScheme(
            primary: Color(0xFF3AA6D0),
            secondary: Color(0xFFF4C542), // Golden
            surface: Color(0xFF0F1E3B),
            background: Color(0xFF0F1E3B),
            error: Colors.red,
            onPrimary: Colors.white,
            onSecondary: Colors.black,
            onSurface: Colors.white,
            onBackground: Colors.white,
            onError: Colors.white,
            brightness: Brightness.dark,
          ),
          textTheme: GoogleFonts.cairoTextTheme(),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF3AA6D0),
            foregroundColor: Colors.white,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3AA6D0),
              foregroundColor: Colors.white,
            ),
          ),
        ),
        home: const AuthWrapper(), // Will be authentication screen (stub)
        routes: {
          '/home': (context) => const HomeScreen(),
          '/notebook': (context) => const NotebookScreen(),
          '/advice': (context) => const AdviceScreen(),
          '/age_tracker': (context) => const AgeTrackerScreen(),
          '/challenges': (context) => const ChallengesScreen(),
          '/settings': (context) => const SettingsScreen(),
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with actual Firebase authentication
    // For now, directly navigate to home
    Future.delayed(Duration.zero, () {
      Navigator.pushReplacementNamed(context, '/home');
    });
    
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}