import 'package:flutter/material.dart';
import 'package:spotify_clone/utils/appTheme.dart';
import 'package:spotify_clone/utils/images.dart';
import 'package:spotify_clone/utils/widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Recently played",
                            style: textTheme.headline1!
                                .copyWith(fontSize: 19, color: Colors.white)),
                        Row(
                          children: const [
                            Icon(Icons.notifications_outlined,
                                color: AppColors.whiteButton),
                            SizedBox(width: 15.0),
                            Icon(Icons.restore, color: AppColors.whiteButton),
                            SizedBox(width: 15.0),
                            Icon(Icons.settings, color: AppColors.whiteButton)
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                    child: SizedBox(
                      height: 120,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                            8, (index) => Image.asset(AppImages.played)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(AppImages.image2, height: 58, width: 58),
                        const SizedBox(width: 10.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("#SPOTIFYWRAPPED",
                                style: textTheme.headline1!.copyWith(
                                    fontSize: 10,
                                    color: AppColors.appGrey,
                                    fontWeight: FontWeight.w400)),
                            Text("Your 2021 in review",
                                style: textTheme.headline1!.copyWith(
                                    fontSize: 26,
                                    color: AppColors.whiteButton,
                                    fontWeight: FontWeight.w400))
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                    child: Row(
                      children: [
                        _playList(
                            "Your Top Songs 2021", AppImages.image1, textTheme),
                        const SizedBox(width: 15.0),
                        _playList("Your Artists Revealed", AppImages.image3,
                            textTheme),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                    child: Text("Editor's picks",
                        style: textTheme.headline1!.copyWith(
                            fontSize: 24, color: AppColors.whiteButton)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                    child: SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                            8,
                            (index) => Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Image.asset(
                                    index % 2 == 0
                                        ? AppImages.image3
                                        : AppImages.image1,
                                  ),
                                )),
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
              MusicPlayer(textTheme: textTheme)
            ],
          ),
        )
      ],
    );
  }

  Widget _playList(String text, String image, TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(image, height: 150, width: 150),
        const SizedBox(height: 7.0),
        Text(text,
            style: textTheme.headline1!.copyWith(
                fontSize: 13,
                color: AppColors.whiteButton,
                fontWeight: FontWeight.w600))
      ],
    );
  }
}
