import 'package:flutter/material.dart';
import 'package:spotify_clone/utils/appTheme.dart';
import 'package:spotify_clone/utils/widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: Text("Search",
            style: textTheme.headline1!
                .copyWith(fontSize: 25.0, color: AppColors.whiteButton)),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
              size: 30.0,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchBar(),
                const SizedBox(height: 25.0),
                Text("Your top genres",
                    style: textTheme.headline1!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.whiteButton)),
                const SizedBox(height: 10.0),
                SizedBox(
                  height: 109,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(5, (index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 10.0),
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: index % 2 == 0
                                  ? const Color(0xFF9854B2)
                                  : const Color(0xFF3371E4)),
                          child: Center(
                            child: Text(
                              index % 2 == 0 ? "Pop" : "Indie",
                              style: textTheme.headline1!.copyWith(
                                  fontSize: 20, color: AppColors.whiteButton),
                            ),
                          ),
                        );
                      })),
                ),
                const SizedBox(height: 30.0),
                Text("Popular podcast categories",
                    style: textTheme.headline1!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.whiteButton)),
                const SizedBox(height: 10.0),
                SizedBox(
                  height: 109,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(5, (index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 10.0),
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: index % 2 == 0
                                  ? const Color(0xFF678026)
                                  : const Color(0xFFCF4321)),
                          child: Center(
                            child: Text(
                              index % 2 == 0 ? "News & Politics" : "Comedy",
                              style: textTheme.headline1!.copyWith(
                                  fontSize: 20, color: AppColors.whiteButton),
                            ),
                          ),
                        );
                      })),
                ),
                const SizedBox(height: 30.0),
                Text("Popular podcast categories",
                    style: textTheme.headline1!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.whiteButton)),
                const SizedBox(height: 10.0),
                Expanded(
                  child: GridView.builder(
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 1.2,
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10.0),
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: index % 2 == 0
                                ? const Color(0xFFABBB6D)
                                : const Color(0xFF223160)),
                        child: Center(
                          child: Text(
                            index % 2 == 0 ? "News & Politics" : "Comedy",
                            style: textTheme.headline1!.copyWith(
                                fontSize: 20, color: AppColors.whiteButton),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          MusicPlayer(textTheme: textTheme)
        ],
      ),
    );
  }
}
