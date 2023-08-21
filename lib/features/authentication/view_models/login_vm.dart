import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_flutter/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_flutter/utils.dart';

class LogInViewModel extends AsyncNotifier {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async => await _authRepo.emailSignIn(email, password),
    );
    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    }
  }
}

final loginProvider = AsyncNotifierProvider<LogInViewModel, void>(
  () => LogInViewModel(),
);
