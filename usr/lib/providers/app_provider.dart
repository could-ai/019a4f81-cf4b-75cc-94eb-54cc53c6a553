import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  bool isFirstLaunch;
  int userAge;
  bool _isDayTime = true;
  bool _isMorning = true;

  AppProvider({required this.isFirstLaunch, required this.userAge}) {
    _updateTimeBasedValues();
  }

  bool get isDayTime => _isDayTime;
  bool get isMorning => _isMorning;

  void _updateTimeBasedValues() {
    final now = TimeOfDay.now();
    _isDayTime = now.hour >= 6 && now.hour < 18; // 6 AM to 6 PM
    _isMorning = now.hour >= 5 && now.hour < 12; // 5 AM to 12 PM
  }

  void updateUserAge(int age) {
    userAge = age;
    notifyListeners();
    // TODO: Save to Firebase Firestore
  }

  void setFirstLaunchComplete() {
    isFirstLaunch = false;
    notifyListeners();
    // TODO: Save to Firebase
  }

  // Refresh time-based values
  void refreshTime() {
    _updateTimeBasedValues();
    notifyListeners();
  }
}