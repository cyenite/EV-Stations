import 'package:ev_stations/constants/pallete.dart';
import 'package:ev_stations/screens/auth/provider_button.dart';
import 'package:ev_stations/screens/auth/sign_in_up_bar.dart';
import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';

class SignIn extends StatelessWidget {
  const SignIn({
    Key key,
    @required this.onRegisterClicked,
  }) : super(key: key);

  final VoidCallback onRegisterClicked;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isSubmitting = context.isSubmitting();
    return SignInForm(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Image.asset(
                      "images/logo.png",
                      height: size.height * 0.1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'EV Stations',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'World of EV privileges',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    SignInBar(
                      isLoading: isSubmitting,
                      onPressed: () {
                        context.signInWithEmailAndPassword();
                      },
                    ),
                    const Text(
                      "Login",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ProviderButton(
                          context: context,
                          signInType: "google",
                        ),
                        ProviderButton(
                          context: context,
                          signInType: "apple",
                        ),
                        ProviderButton(
                          context: context,
                          signInType: "twitter",
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        context.signInAnonymously();
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Continue without registration",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Palette.gradientColorEnd,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
