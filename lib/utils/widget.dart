import 'package:flutter/material.dart';
import 'package:spotify_clone/utils/appTheme.dart';
import 'package:spotify_clone/utils/images.dart';

//Dynamic Application Button
class AppButtons extends StatelessWidget {
  final Color buttonColor;
  final double borderRadius;
  final Widget child;
  final Function onTap;
  Widget? leadingIcon;
  final Color fontColor;
  final bool leadingAvailable;
  final Color borderColor;
  final double width;
  final double height;
  AppButtons(
      {super.key,
      required this.fontColor,
      required this.buttonColor,
      required this.borderRadius,
      required this.child,
      required this.onTap,
      required this.leadingAvailable,
      required this.borderColor,
      required this.width,
      required this.height,
      this.leadingIcon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      style: ElevatedButton.styleFrom(
          maximumSize: Size(width, height),
          backgroundColor: buttonColor,
          foregroundColor: fontColor,
          side: BorderSide(color: borderColor),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius))),
      child: leadingAvailable
          ? Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              leadingIcon!,
              const Expanded(child: SizedBox()),
              child,
              const Expanded(child: SizedBox()),
            ])
          : Center(child: child),
    );
  }
}

//Appbar
class AppHeader extends StatelessWidget {
  final Widget title;
  final bool isActionAvailable;
  final bool isLeadingAvailable;
  final bool centerTitle;
  Widget? leadingIcon;
  AppHeader(
      {super.key,
      required this.title,
      required this.centerTitle,
      this.leadingIcon,
      required this.isActionAvailable,
      required this.isLeadingAvailable});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isLeadingAvailable ? leadingIcon : null,
      elevation: 0.0,
      centerTitle: centerTitle,
      backgroundColor: Colors.black,
      title: title,
    );
  }
}

//Route for page transition
Route createRoute(Widget screen) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

//Search Bar
class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.appGreen,
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(top: 13),
          hintText: 'search',
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          filled: true,
          fillColor: AppColors.whiteButton),
    );
  }
}

//Music Player
class MusicPlayer extends StatelessWidget {
  final TextTheme textTheme;
  const MusicPlayer({super.key, required this.textTheme});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: const Color(0xFF550A1C),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
              child: Image.asset(AppImages.played),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text("From Me to You - Mono / Remastered",
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.headline1!.copyWith(
                          fontSize: 13,
                          color: AppColors.whiteButton,
                          fontWeight: FontWeight.w400)),
                ),
                const SizedBox(height: 5.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text("Eminem",
                      style: textTheme.headline1!.copyWith(
                          fontSize: 10,
                          color: AppColors.appGreen,
                          fontWeight: FontWeight.w400)),
                ),
                const Expanded(child: SizedBox()),
                Container(
                  height: 4,
                  width: MediaQuery.of(context).size.width / 5,
                  color: AppColors.whiteButton,
                )
              ],
            ),
            const Expanded(child: SizedBox()),
            const Center(
                child: Icon(
              Icons.bluetooth,
              color: AppColors.appGreen,
            )),
            const Center(
                child: Icon(
              Icons.pause,
              color: Colors.white,
            )),
            const SizedBox(width: 10.0)
          ],
        ),
      ),
    );
  }
}
