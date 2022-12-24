import 'package:flutter/material.dart';

import '../../utility/project_colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.title, this.leading, this.actions});
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      leading: leading,
      backgroundColor: ProjectColors.primary,
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight((kToolbarHeight));
}
