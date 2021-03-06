import 'package:ev_stations/screens/auth/auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';

import 'constants/pallete.dart';
import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LitAuthInit(
      authProviders: const AuthProviders(
        emailAndPassword: true,
        google: true,
        apple: true,
        twitter: true,
        anonymous: true,
      ),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'EV Stations',
        theme: ThemeData.dark().copyWith(
          primaryColor: Palette.primaryColor,
          primaryColorDark: Palette.primaryColor,
          accentColor: Palette.primaryColor,
        ),
        home: const LitAuthState(
          authenticated: NavigationScreen(),
          unauthenticated: AuthScreen(),
        ),
        //home: const SplashScreen(),
      ),
    );
  }
}
