import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_flutter/constants/sizes.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({
    super.key,
    required this.isSelectedMainIndex,
  });

  final bool isSelectedMainIndex;

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
            color: isSelectedMainIndex ? Colors.white : Colors.black,
            borderRadius: BorderRadius.circular(Sizes.size10),
          ),
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              color: isSelectedMainIndex ? Colors.black : Colors.white,
              size: Sizes.size20,
            ),
          ),
        )
      ],
    );
  }
}
