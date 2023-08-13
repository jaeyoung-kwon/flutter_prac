import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_flutter/constants/gaps.dart';
import 'package:tiktok_flutter/constants/sizes.dart';
import 'package:tiktok_flutter/features/discover/discover_screen.dart';
import 'package:tiktok_flutter/features/inbox/inbox_screen.dart';
import 'package:tiktok_flutter/features/main/widgets/navigation_tab.dart';
import 'package:tiktok_flutter/features/main/widgets/post_video_button.dart';
import 'package:tiktok_flutter/features/users/user_profile_screen.dart';
import 'package:tiktok_flutter/utils.dart';
import 'package:tiktok_flutter/features/videos/video_timeline_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1;
  bool _isSelectedMainIndex = true;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
      _isSelectedMainIndex = index == 0;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text("Post Video"),
          ),
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:
          _isSelectedMainIndex || isDark ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const DiscoverScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const InboxScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const UserProfileScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: _isSelectedMainIndex || isDark ? Colors.black : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavigationTab(
                  text: "home",
                  icon: FontAwesomeIcons.house,
                  selectedIcon: FontAwesomeIcons.house,
                  isSelected: _selectedIndex == 0,
                  onTap: () => _onTap(0),
                  isSelectedMainIndex: _isSelectedMainIndex),
              NavigationTab(
                  text: "Discover",
                  icon: FontAwesomeIcons.compass,
                  selectedIcon: FontAwesomeIcons.solidCompass,
                  isSelected: _selectedIndex == 1,
                  onTap: () => _onTap(1),
                  isSelectedMainIndex: _isSelectedMainIndex),
              Gaps.h24,
              GestureDetector(
                onTap: _onPostVideoButtonTap,
                child: PostVideoButton(
                  isSelectedMainIndex: _isSelectedMainIndex,
                ),
              ),
              Gaps.h24,
              NavigationTab(
                  text: "Inbox",
                  icon: FontAwesomeIcons.message,
                  selectedIcon: FontAwesomeIcons.solidMessage,
                  isSelected: _selectedIndex == 3,
                  onTap: () => _onTap(3),
                  isSelectedMainIndex: _isSelectedMainIndex),
              NavigationTab(
                  text: "Profile",
                  icon: FontAwesomeIcons.user,
                  selectedIcon: FontAwesomeIcons.solidUser,
                  isSelected: _selectedIndex == 4,
                  onTap: () => _onTap(4),
                  isSelectedMainIndex: _isSelectedMainIndex),
            ],
          ),
        ),
      ),
    );
  }
}
