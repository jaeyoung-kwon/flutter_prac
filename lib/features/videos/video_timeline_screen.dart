import 'package:flutter/material.dart';
import 'package:tiktok_flutter/features/videos/widgets/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.teal,
    Colors.yellow,
  ];

  final Duration _videoDuration = const Duration(milliseconds: 200);
  final Curve _videoCurve = Curves.linear;

  final PageController _pageController = PageController();

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: _videoDuration,
      curve: _videoCurve,
    );
    if (page == colors.length - 1) {
      colors.addAll([
        Colors.blue,
        Colors.red,
        Colors.teal,
        Colors.yellow,
      ]);
      setState(() {});
    }
  }

  void _onVideoFinished() {
    return;
    _pageController.nextPage(
      duration: _videoDuration,
      curve: _videoCurve,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  Future<void> _onRefresh() {
    return Future.delayed(
      const Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      edgeOffset: 20,
      color: Theme.of(context).primaryColor,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        onPageChanged: _onPageChanged,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return VideoPost(onVideoFinished: _onVideoFinished, index: index);
        },
      ),
    );
  }
}
