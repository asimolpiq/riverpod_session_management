import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_session_management/product/components/appbar/custom_appbar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:riverpod_session_management/product/utility/project_colors.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(title: "HomePage"),
        bottomNavigationBar: const _CustomBottomBar(),
        body: Column(
          children: const [],
        ));
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
          icon: Icons.event,
          text: 'TimeSheet',
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
