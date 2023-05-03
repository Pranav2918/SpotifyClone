import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/onboarding/nameScreen.dart';
import 'package:spotify_clone/utils/appTheme.dart';
import 'package:spotify_clone/utils/widget.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppHeader(
            centerTitle: true,
            isActionAvailable: false,
            isLeadingAvailable: true,
            leadingIcon: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back_ios, color: Colors.white)),
            title: const Text("Create Account")),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("What's your email?",
                style: textTheme.headline1!
                    .copyWith(fontSize: 20.0, color: AppColors.whiteButton)),
            const SizedBox(height: 10.0),
            TextFormField(
              cursorColor: AppColors.appGreen,
              decoration: const InputDecoration(
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  filled: true,
                  fillColor: AppColors.textFieldGrey),
            ),
            const SizedBox(height: 10.0),
            Text("You'll need to confirm this email later.",
                style: textTheme.headline1!
                    .copyWith(fontSize: 10.0, color: AppColors.whiteButton)),
            const SizedBox(height: 35.0),
            Text("Create a password",
                style: textTheme.headline1!
                    .copyWith(fontSize: 20.0, color: AppColors.whiteButton)),
            const SizedBox(height: 10.0),
            TextFormField(
              obscureText: true,
              cursorColor: AppColors.appGreen,
              decoration: const InputDecoration(
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  filled: true,
                  fillColor: AppColors.textFieldGrey),
            ),
            const SizedBox(height: 10.0),
            Text("Use atleast 8 characters.",
                style: textTheme.headline1!
                    .copyWith(fontSize: 10.0, color: AppColors.whiteButton)),
            const Expanded(child: SizedBox()),
            Center(
              child: AppButtons(
                  height: 40,
                  width: 100,
                  fontColor: Colors.white,
                  buttonColor: AppColors.whiteButton,
                  borderRadius: 50.0,
                  onTap: () {
                    Navigator.of(context).push(createRoute(const NameScreen()));
                  },
                  leadingAvailable: false,
                  borderColor: Colors.transparent,
                  child: Text(
                    "Next",
                    style: textTheme.headline1!
                        .copyWith(fontSize: 16, color: Colors.black),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
