import 'package:go_router/go_router.dart';
import 'package:tiktok_flutter/features/authentication/email_screen.dart';
import 'package:tiktok_flutter/features/authentication/login_screen.dart';
import 'package:tiktok_flutter/features/authentication/sign_up_screen.dart';
import 'package:tiktok_flutter/features/authentication/username_screen.dart';
import 'package:tiktok_flutter/features/users/user_profile_screen.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: SignUpScreen.routeName,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: UsernameScreen.routeName,
      builder: (context, state) => const UsernameScreen(),
    ),
    GoRoute(
      path: EmailScreen.routeName,
      builder: (context, state) => const EmailScreen(),
    ),
    GoRoute(
      path: "/user/:username",
      builder: (context, state) {
        final username = state.pathParameters["username"];
        final tab = state.uri.queryParameters["show"];
        return UserProfileScreen(username: username!, tab: tab!);
      },
    )
  ],
);
