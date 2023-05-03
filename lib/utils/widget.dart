import 'package:flutter/material.dart';
import 'package:spotify_clone/utils/appTheme.dart';

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
