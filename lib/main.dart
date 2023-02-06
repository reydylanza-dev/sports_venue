import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spod_app/screen/main/main_screen.dart';
import 'package:spod_app/screen/onboarding_screen.dart';
import 'package:spod_app/theme.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //final prefs = await SharedPreferences.getInstance();
  //final skipOnBoarding = prefs.getBool("skipOnBoarding") ?? false;
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final bool skipOnBoarding;

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spod',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: createMaterialColor(primaryColor500),
          canvasColor: colorWhite),
      home: OnboardingScreen(),
      // home: skipOnBoarding ? MainScreen(currentScreen: 0) : OnboardingScreen(),
    );
  }
}
