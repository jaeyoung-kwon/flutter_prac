import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_flutter/contants/sizes.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: Sizes.size20,
          child: Container(
            height: Sizes.size32,
            width: Sizes.size24,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF61D4F0),
              borderRadius: BorderRadius.circular(Sizes.size10),
            ),
          ),
        ),
        Positioned(
          left: Sizes.size20,
          child: Container(
            height: Sizes.size32,
            width: Sizes.size24,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(Sizes.size10),
            ),
          ),
        ),
        Container(
          height: Sizes.size32,
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size10,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Sizes.size10),
          ),
          child: const Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              color: Colors.black,
              size: Sizes.size20,
            ),
          ),
        )
      ],
    );
  }
}
