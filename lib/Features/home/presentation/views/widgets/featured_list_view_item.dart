import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
        width: MediaQuery.of(context).size.width * .4,
        height: MediaQuery.of(context).size.height * .25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.red,
          image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                AssetsData.imagebook,
              )),
        ),
      ),
    );
  }
}
