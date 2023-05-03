import 'package:flutter/material.dart';
import 'package:spotify_clone/utils/images.dart';
import '../../utils/widget.dart';
import 'choosePodcast.dart';

class ChooseArtist extends StatelessWidget {
  const ChooseArtist({super.key});

  @override
  Widget build(BuildContext context) {
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
            title: const Text("Choose 3 or more artists you like.")),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SearchBar(),
              const SizedBox(height: 20.0),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, createRoute(const ChoosePodcast()));
                  },
                  child: Image.asset(AppImages.artist))
            ],
          ),
        ),
      ),
    );
  }
}
