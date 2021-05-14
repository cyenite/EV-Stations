import 'package:ev_stations/screens/auth/sign_in.dart';
import 'package:ev_stations/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key key}) : super(key: key);
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  ValueNotifier<bool> showSignInPage = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
              image: AssetImage("images/logo2.jpg"),
              fit: BoxFit.cover),
        ),
        child: LitAuth.custom(
          errorNotification: const NotificationConfig(
            backgroundColor: Color(0xff017f04),
            icon: Icon(
              Icons.error_outline,
              color: Colors.deepOrange,
              size: 32,
            ),
          ),
          onAuthSuccess: () {
            Get.off(NavigationScreen());
          },
          child: Stack(
            children: [
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: SignIn(
                    key: const ValueKey('SignIn'),
                    onRegisterClicked: () {
                      context.resetSignInForm();
                      showSignInPage.value = false;
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
