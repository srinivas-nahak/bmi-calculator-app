import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/bmi_input_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return ResponsiveSizer(
      builder: (context, orientation, screenType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          useMaterial3: true,
          primaryColor: kPrimaryColor,
          appBarTheme: const AppBarTheme().copyWith(color: kAppBarColor),
          scaffoldBackgroundColor: kPrimaryColor,
        ),
        home: const BmiInputScreen(),
      ),
    );
  }
}
