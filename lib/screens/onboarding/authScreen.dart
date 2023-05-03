import 'package:flutter/material.dart';
import 'package:spotify_clone/utils/appTheme.dart';
import 'package:spotify_clone/utils/images.dart';
import 'package:spotify_clone/utils/widget.dart';

import 'createAccount.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Column(
        children: [
          Image.asset(AppImages.splashImage),
          const SizedBox(height: 10, width: 0.0),
          Text("Millions of Songs.\nFree on Spotify.",
              textAlign: TextAlign.center,
              style: textTheme.headline1!
                  .copyWith(fontSize: 28.0, color: Colors.white)),
          const SizedBox(height: 22.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            child: AppButtons(
                height: 40,
                width: MediaQuery.of(context).size.width,
                borderColor: Colors.transparent,
                leadingAvailable: false,
                fontColor: Colors.black,
                buttonColor: AppColors.appGreen,
                borderRadius: 45.0,
                onTap: () {
                  Navigator.of(context)
                      .push(createRoute(const CreateAccount()));
                },
                child: Text("Sign up for free",
                    style: textTheme.headline1!.copyWith(color: Colors.black))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            child: AppButtons(
                height: 40,
                width: MediaQuery.of(context).size.width,
                borderColor: Colors.white,
                leadingAvailable: true,
                fontColor: Colors.black,
                buttonColor: Colors.transparent,
                borderRadius: 45.0,
                leadingIcon: Image.asset(AppImages.googleLogo),
                onTap: () {},
                child: Text(
                  "Continue with Google",
                  style: textTheme.headline1!
                      .copyWith(color: AppColors.whiteButton),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            child: AppButtons(
                height: 40,
                width: MediaQuery.of(context).size.width,
                borderColor: Colors.white,
                leadingAvailable: true,
                fontColor: Colors.black,
                buttonColor: Colors.transparent,
                borderRadius: 45.0,
                leadingIcon: Image.asset(AppImages.facebookLogo),
                onTap: () {
                  print("Sign up");
                },
                child: Text(
                  "Continue with Facebook",
                  style: textTheme.headline1!
                      .copyWith(color: AppColors.whiteButton),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            child: AppButtons(
                height: 40,
                width: MediaQuery.of(context).size.width,
                borderColor: Colors.white,
                leadingAvailable: true,
                fontColor: Colors.black,
                buttonColor: Colors.transparent,
                borderRadius: 45.0,
                leadingIcon: Image.asset(AppImages.appleLogo),
                onTap: () {
                  print("Sign up");
                },
                child: Text("Continue with Apple",
                    style: textTheme.headline1!
                        .copyWith(color: AppColors.whiteButton))),
          )
        ],
      ),
    );
  }
}
