import 'package:flutter/material.dart';
import 'package:tarea6/common/color_palette.dart';
import 'package:tarea6/widgets/my_appbar.dart';
import 'package:tarea6/widgets/my_title.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Sobre Mi"),
      body: Container(
        padding: EdgeInsets.all(30),
        width: double.infinity,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage:AssetImage("assets/saul.png"),
              backgroundColor: ColorPalette.yellow,
            ),
            SizedBox(height: 20,),
            MyTitle(text: "Saul Enrique Santana Mercedes", color: ColorPalette.gray,),  
            Text("Matricula 2022-2097"),
            SizedBox(height: 20,),
            Text("Telegram"),
            SizedBox(height: 5,),
            MyTitle(text: "https://t.me/x_MMIV_x", color: ColorPalette.gray,),
            SizedBox(height: 20,),
            Divider(color: ColorPalette.yellow, thickness: 2, height: 0,),
            SizedBox(height: 20,),
            Text( "Correo"),
            SizedBox(height: 5,),
            MyTitle(text: "saulsantan0412@gmail.com", color: ColorPalette.gray,),
            SizedBox(height: 20,),
            Divider(color: ColorPalette.yellow, thickness: 2, height: 0,),
            SizedBox(height: 20,),
            Text( "Linkedin"),
            MyTitle(text: "linkedin.com/in/saulsantana0412", color: ColorPalette.gray,),
            SizedBox(height: 20,),
            Divider(color: ColorPalette.yellow, thickness: 2, height: 0,),
            SizedBox(height: 20,),
            Text( "Github"),
            MyTitle(text: "github.com/saulsantana0412", color: ColorPalette.gray,),
          ],
        ),
      ),
    );
}
}