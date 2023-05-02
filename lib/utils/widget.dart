import 'package:flutter/material.dart';

class AppButtons extends StatelessWidget {
  final Color buttonColor;
  final double borderRadius;
  final Widget child;
  final Function onTap;
  Widget? leadingIcon;
  final Color fontColor;
  final bool leadingAvailable;
  final Color borderColor;
  AppButtons(
      {super.key,
      required this.fontColor,
      required this.buttonColor,
      required this.borderRadius,
      required this.child,
      required this.onTap,
      required this.leadingAvailable,
      required this.borderColor,
      this.leadingIcon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      style: ElevatedButton.styleFrom(
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
