import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:page_transition/page_transition.dart';
import 'package:to_do_list/constant/colors.dart';
import 'package:to_do_list/constant/dimensions.dart';
import 'package:to_do_list/constant/strings.dart';
import 'package:to_do_list/pages/home_page.dart';
import 'package:to_do_list/persistent/hive_constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<List>(kHiveListBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          duration: 2500,
          splash: const Center(
            child: Text(
              kTitleText,
              style: TextStyle(
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: kSP40x),
            ),
          ),
          nextScreen: const HomePage(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          backgroundColor: kSecondaryColor),
    );
  }
}
