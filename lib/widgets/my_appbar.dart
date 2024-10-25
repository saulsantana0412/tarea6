import 'package:flutter/material.dart';
import 'package:tarea6/common/color_palette.dart';
import 'package:tarea6/widgets/my_title.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTitle2(text: title, color: ColorPalette.blueblack,),
            SizedBox(width: 30,)
          ],
        )
      )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}