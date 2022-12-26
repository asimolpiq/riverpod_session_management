import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_session_management/core/auth_manager.dart';
import 'package:riverpod_session_management/core/cache_manager.dart';
import 'package:riverpod_session_management/model/user_model.dart';
import 'package:riverpod_session_management/model/user_request_model.dart';
import 'package:riverpod_session_management/service/login_service.dart';
import 'package:riverpod_session_management/view/login/login_view.dart';
import 'package:riverpod_session_management/view/home/home_view.dart';

import '../../../product/strings/auth_strings.dart';

abstract class LoginViewModel extends ConsumerState<LoginPage> with CacheManager {
  late final LoginService loginService;
  final _baseUrl = 'https://reqres.in';

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isVisible = false;
  final LoginStrings loginStrings = LoginStrings();

  @override
  void initState() {
    super.initState();
    final dio = Dio(BaseOptions(baseUrl: _baseUrl));
    loginService = LoginService(dio);
  }

  Future<void> fetchUserLogin(String email, String password) async {
    final response = await loginService.fetchLogin(UserRequestModel(email: email, password: password));

    if (response != null) {
      saveToken(response.token ?? '');
      navigateToHome();
      ref.read(AuthProvider).model = UserModel.fake();
    }
  }

  void navigateToHome() {
    context.navigation.popUntil((route) => false);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Homepage()));
  }
}
