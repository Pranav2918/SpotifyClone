import 'package:flutter/material.dart';
import 'package:spotify_clone/utils/appTheme.dart';
import 'package:spotify_clone/utils/images.dart';

class AlbumView extends StatelessWidget {
  const AlbumView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: const Color(0xFF962419),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.keyboard_arrow_down_rounded,
              color: Colors.white),
        ),
        centerTitle: true,
        title: Text(
          "1(Remastered)",
          style: textTheme.headline1!
              .copyWith(fontSize: 14, color: AppColors.whiteButton),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xFF962419),
              Color(0xFF661710),
              Color(0xFF430E09),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 68,
                ),
                Image.asset(
                  AppImages.played,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text("From Me to You - Mono / Remast",
                          style: textTheme.headline1!.copyWith(
                              fontSize: 22,
                              color: Colors.white,
                              overflow: TextOverflow.fade)),
                    ),
                    const Icon(Icons.favorite_border, color: Color(0xFFB3B3B3))
                  ],
                ),
                Text("The Beatles",
                    style: textTheme.headline1!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFB3B3B3),
                        overflow: TextOverflow.fade)),
                const SizedBox(height: 25.0),
                Row(
                  children: [
                    Expanded(child: Container(height: 3, color: Colors.white)),
                    Container(
                        height: 3,
                        color: const Color(0xFFB3B3B3),
                        width: MediaQuery.of(context).size.width / 2)
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "0:38",
                      style: textTheme.headline1!.copyWith(
                          fontSize: 10, color: const Color(0xFFB3B3B3)),
                    ),
                    Text("-1:18",
                        style: textTheme.headline1!.copyWith(
                            fontSize: 10, color: const Color(0xFFB3B3B3)))
                  ],
                ),
                const Expanded(child: SizedBox()),
                _playerButtons(),
                const Expanded(child: SizedBox()),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _playerButtons() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(
            Icons.shuffle,
            color: Colors.white,
          ),
          Icon(
            Icons.skip_previous_sharp,
            color: Colors.white,
            size: 35,
          ),
          Icon(
            Icons.pause_circle_filled_sharp,
            color: Colors.white,
            size: 67,
          ),
          Icon(
            Icons.skip_next_sharp,
            color: Colors.white,
            size: 35,
          ),
          Icon(
            Icons.share,
            color: AppColors.appGreen,
          )
        ]);
  }
}
