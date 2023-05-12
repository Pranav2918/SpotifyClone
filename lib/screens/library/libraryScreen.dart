import 'package:flutter/material.dart';
import 'package:spotify_clone/utils/appTheme.dart';
import 'package:spotify_clone/utils/images.dart';
import 'package:spotify_clone/utils/widget.dart';

class LibraryScreen extends StatelessWidget {
  final String userImage =
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80";
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Container(
          height: 25,
          width: 25,
          margin: const EdgeInsets.fromLTRB(8.0, 10.0, 10.0, 0.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(userImage), fit: BoxFit.cover)),
        ),
        backgroundColor: Colors.black,
        elevation: 0.0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 10.0, right: 10.0),
            child: Icon(Icons.add, color: AppColors.whiteButton, size: 25.0),
          )
        ],
        title: Text("Your Library",
            style: textTheme.headline1!
                .copyWith(fontSize: 24, color: Colors.white)),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const SizedBox(width: 5.0),
                  _tag("Playlists", textTheme),
                  const SizedBox(width: 5.0),
                  _tag("Artists", textTheme),
                  const SizedBox(width: 5.0),
                  _tag("Albums", textTheme),
                  const SizedBox(width: 5.0),
                  _tag("Shows", textTheme),
                  const SizedBox(width: 5.0),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recently played",
                      style: textTheme.headline1!
                          .copyWith(fontSize: 12, color: Colors.white),
                    ),
                    const Icon(Icons.apps_sharp, color: Colors.white)
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: AppColors.appGrey,
                              image: DecorationImage(
                                image: AssetImage(
                                    index == 2 || index == 4 || index == 7
                                        ? AppImages.appLogo
                                        : AppImages.image1),
                              ),
                              shape: index == 2 || index == 4 || index == 7
                                  ? BoxShape.circle
                                  : BoxShape.rectangle),
                        ),
                        title: Text(
                          "Album $index",
                          style: textTheme.headline1!
                              .copyWith(fontSize: 15, color: Colors.white),
                        ),
                        subtitle: Text("Artist",
                            style: textTheme.headline1!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: const Color(0xFFB3B3B3))),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
          MusicPlayer(textTheme: textTheme)
        ],
      ),
    );
  }

  //Tag
  Widget _tag(String title, TextTheme textTheme) {
    return Expanded(
        child: Container(
      height: 40.0,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF7F7F7F)),
          borderRadius: BorderRadius.circular(45.0)),
      child: Center(
        child: Text(title,
            style: textTheme.headline1!.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 13)),
      ),
    ));
  }
}
