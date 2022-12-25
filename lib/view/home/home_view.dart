import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_session_management/core/auth_manager.dart';
import 'package:riverpod_session_management/core/cache_manager.dart';
import 'package:riverpod_session_management/model/user_model.dart';
import 'package:riverpod_session_management/product/components/appbar/custom_appbar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:riverpod_session_management/product/utility/project_colors.dart';
import 'package:riverpod_session_management/view/login/login_view.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState<Homepage> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> with CacheManager {
  String token = '';

  late UserModel? userModel;

  Future<void> getTokenCAche() async {
    token = await getToken() ?? '';
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    userModel = ref.read(AuthProvider).model;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: userModel?.name ?? '',
        actions: [
          IconButton(
              onPressed: () {
                ref.read(AuthProvider).signout();
                context.navigation.popUntil((route) => false);
                context.navigation.push(MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
      bottomNavigationBar: const _CustomBottomBar(),
      body: Image.network(userModel?.imageUrl ?? '', fit: BoxFit.fill),
    );
  }
}

class _CustomBottomBar extends StatelessWidget {
  const _CustomBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GNav(
      gap: 8,
      backgroundColor: ProjectColors.primary,
      activeColor: ProjectColors.white,
      color: ProjectColors.lightGrey,
      duration: context.durationLow,
      tabs: const [
        GButton(
          icon: Icons.home,
          text: 'Anasayfa',
        ),
        GButton(
          icon: Icons.task,
          text: 'Görevler',
        ),
        GButton(
          icon: Icons.message_outlined,
          text: 'Chat',
        )
      ],
    );
  }
}
