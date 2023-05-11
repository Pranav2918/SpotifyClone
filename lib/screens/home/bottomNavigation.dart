import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/home/homeScreen.dart';
import 'package:spotify_clone/screens/search/searchScreen.dart';
import 'package:spotify_clone/utils/appTheme.dart';
import 'package:spotify_clone/utils/images.dart';

class BottomNavigationHandler extends StatelessWidget {
  final ValueNotifier<int> currentTab = ValueNotifier<int>(0);

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    Container(color: Colors.green),
  ];
  BottomNavigationHandler({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: ValueListenableBuilder(
            valueListenable: currentTab,
            builder: (context, value, child) {
              return _screens[value];
            },
          ),
          bottomNavigationBar: ValueListenableBuilder<int>(
            valueListenable: currentTab,
            builder: (context, value, child) {
              return BottomNavigationBar(
                backgroundColor: Colors.black,
                selectedItemColor: AppColors.appGreen,
                unselectedItemColor: AppColors.whiteButton,
                onTap: (newValue) {
                  currentTab.value = newValue;
                },
                currentIndex: value,
                items: [
                  BottomNavigationBarItem(
                    activeIcon: Image.asset(
                      AppImages.home,
                      color: AppColors.appGreen,
                    ),
                    icon: Image.asset(AppImages.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Image.asset(
                      AppImages.search,
                      color: AppColors.appGreen,
                    ),
                    icon: Image.asset(AppImages.search),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                      activeIcon: Image.asset(
                        AppImages.library,
                        color: AppColors.appGreen,
                      ),
                      icon: Image.asset(AppImages.library),
                      label: 'Your Library')
                ],
              );
            },
          )),
    );
  }
}
