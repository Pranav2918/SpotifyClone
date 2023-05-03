import 'package:flutter/material.dart';
import '../../utils/appTheme.dart';
import '../../utils/widget.dart';
import 'chooseArtist.dart';


class NameScreen extends StatelessWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> offerCheck = ValueNotifier<bool>(false);
    final ValueNotifier<bool> shareInfoCheck = ValueNotifier<bool>(false);

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
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("What's your name?",
                        style: textTheme.headline1!.copyWith(
                            fontSize: 20.0, color: AppColors.whiteButton)),
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
                    Text("This appears on your spotify profile",
                        style: textTheme.headline1!.copyWith(
                            fontSize: 10.0, color: AppColors.whiteButton)),
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 25.0),
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: AppColors.appGrey),
                    Text(
                        "By tapping on “Create account”, you agree to the spotify Terms of Use.",
                        style: textTheme.headline1!.copyWith(
                            fontSize: 10.0, color: AppColors.whiteButton)),
                    const SizedBox(height: 20.0),
                    Text("Terms of Use",
                        style: textTheme.headline1!.copyWith(
                            fontSize: 15.0, color: AppColors.appGreen)),
                    const SizedBox(height: 20.0),
                    Text(
                        "To learn more about how Spotify collect, uses, shares and protects your personal data, Please see the Spotify Privacy Policy.",
                        style: textTheme.headline1!.copyWith(
                            fontSize: 10.0, color: AppColors.whiteButton)),
                    const SizedBox(height: 20.0),
                    Text("Privacy Policy",
                        style: textTheme.headline1!.copyWith(
                            fontSize: 15.0, color: AppColors.appGreen)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Please send me news and offers from Spotify",
                            style: textTheme.headline1!.copyWith(
                                fontSize: 10.0, color: AppColors.whiteButton)),
                        ValueListenableBuilder<bool>(
                          valueListenable: offerCheck,
                          builder: (context, value, child) {
                            return Checkbox(
                                activeColor: AppColors.appGreen,
                                side:
                                    const BorderSide(color: AppColors.appGrey),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: AppColors.appGreen),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                value: value,
                                onChanged: (bool? newValue) {
                                  offerCheck.value = newValue!;
                                });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                              "Share my registration data with Spotify’s content providers for marketing purposes.",
                              style: textTheme.headline1!.copyWith(
                                  fontSize: 10.0,
                                  color: AppColors.whiteButton)),
                        ),
                        ValueListenableBuilder<bool>(
                          valueListenable: shareInfoCheck,
                          builder: (context, value, child) {
                            return Checkbox(
                                activeColor: AppColors.appGreen,
                                side:
                                    const BorderSide(color: AppColors.appGrey),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: AppColors.appGreen),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                value: value,
                                onChanged: (bool? newValue) {
                                  shareInfoCheck.value = newValue!;
                                });
                          },
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Center(
                        child: AppButtons(
                            height: 40,
                            width: 250,
                            fontColor: Colors.white,
                            buttonColor: AppColors.whiteButton,
                            borderRadius: 50.0,
                            onTap: () {
                              Navigator.of(context)
                                  .push(createRoute(const ChooseArtist()));
                            },
                            leadingAvailable: false,
                            borderColor: Colors.transparent,
                            child: Text(
                              "Create Account",
                              style: textTheme.headline1!
                                  .copyWith(fontSize: 16, color: Colors.black),
                            )))
                  ],
                ),
              )
            ],
          )),
    );
  }
}
