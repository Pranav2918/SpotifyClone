import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/home/bottomNavigation.dart';
import 'package:spotify_clone/utils/widget.dart';
import '../../utils/appTheme.dart';
import '../../utils/images.dart';

class ChoosePodcast extends StatelessWidget {
  const ChoosePodcast({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Now choose some\npodcasts.",
                        style: textTheme.headline1!.copyWith(
                            fontSize: 20.0, color: AppColors.whiteButton)),
                    const SizedBox(height: 20.0),
                    const SearchBar(),
                    const SizedBox(height: 20.0),
                    Image.asset(AppImages.artist)
                  ],
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height / 10,
                  left: MediaQuery.of(context).size.width / 3.3,
                  child: AppButtons(
                      fontColor: Colors.black,
                      buttonColor: AppColors.whiteButton,
                      borderRadius: 50.0,
                      onTap: () {
                        Navigator.push(context,
                            createRoute(BottomNavigationHandler()));
                      },
                      leadingAvailable: false,
                      borderColor: Colors.transparent,
                      width: 100,
                      height: 40,
                      child: Text(
                        'Done',
                        style: textTheme.headline1!
                            .copyWith(fontSize: 16, color: Colors.black),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
