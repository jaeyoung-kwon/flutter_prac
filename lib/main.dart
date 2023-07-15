import 'package:flutter/material.dart';
import 'package:tiktok_flutter/contants/gaps.dart';
import 'package:tiktok_flutter/contants/sizes.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok Clone',
      theme: ThemeData(primaryColor: const Color(0xFFE9435A)),
      home: Padding(
        padding: const EdgeInsets.all(Sizes.size14),
        child: Container(
          child: const Column(
            children: [
              Text("TikTok Clone"),
              Gaps.v20,
              Text("TikTok Clone"),
            ],
          ),
        ),
      ),
    );
  }
}
