import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_session_management/model/user_model.dart';

import 'cache_manager.dart';

class AuthenticationManager with CacheManager {
  AuthenticationManager() {
    fetchUserLogin();
  }

  bool isLogin = false;
  UserModel? model;

  Future<void> fetchUserLogin() async {
    final token = await getToken();
    if (token != null) {
      isLogin = true;
    }
  }

  void signout() {
    logout();
    model = null;
    isLogin = false;
  }
}

final AuthProvider = Provider((ref) => AuthenticationManager());
