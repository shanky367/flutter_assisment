import 'package:flutter/material.dart';
import 'package:flutter_assisment/screen/booking_screen.dart';
import 'package:flutter_assisment/screen/home_screen.dart';
import 'package:flutter_assisment/screen/landing_screen.dart';
import 'package:flutter_assisment/screen/profile_screen.dart';
import 'package:flutter_assisment/screen/spalsh_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'adapter/RetailShopsAdapter.dart';
import 'models/shops.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ShopsAdapter());
  runApp(ListenableProvider(
      create: (context) => RetailShopsData(), child: const MyApp()));
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retail shop',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          brightness: Brightness.dark,
          elevation: 2,
          actionsIconTheme: IconThemeData(color: Colors.black),
        ),
        primarySwatch: Colors.orange,
        primaryColor: Color(0xffca6c15),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Roboto",
        buttonTheme: ButtonThemeData(
          height: 51.0,
          minWidth: double.infinity,
          disabledColor: Colors.yellow[200],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          splashColor: Colors.white.withOpacity(0.30),
        ),
        textTheme: const TextTheme(
          caption: TextStyle(fontStyle: FontStyle.italic),
          button: TextStyle(
              fontSize: 15.0,
              letterSpacing: -0.23,
              fontWeight: FontWeight.w700,
              color: Colors.black54),
          headline4: TextStyle(
              fontSize: 32,
              letterSpacing: -0.36,
              color: Color(0xff444444),
              fontWeight: FontWeight.bold),
          headline6: TextStyle(
              fontSize: 18,
              letterSpacing: -0.36,
              color: Color(0xff444444),
              fontWeight: FontWeight.normal),
        ),
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(autoStart: true),
        HomeScreen.id: (context) => const HomeScreen(),
        LandingScreen.id: (context) => const LandingScreen(),
        ProfileScreen.id: (context) => const ProfileScreen(),
        BookingScreen.id: (context) => const BookingScreen(),
      },
    );
  }
}
