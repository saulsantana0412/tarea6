import 'package:flutter/material.dart';
import 'package:tarea6/screens/about_me_screen.dart';
import 'package:tarea6/screens/age_screen.dart';
import 'package:tarea6/screens/gender_screen.dart';
import 'package:tarea6/screens/news_screen.dart';
import 'package:tarea6/screens/university_screen.dart';
import 'package:tarea6/screens/weather_screen.dart';
//import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Option(icon: "gender", screen: GenderScreen()),
                  SizedBox(width: 60),
                  Option(icon: "age", screen: AgeScreen()),
                ],
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Option(icon: "cnn", screen: NewsScreen()),
                  const SizedBox(width: 60),
                  Container(width:100, height:100, child: Image(image: AssetImage("assets/toolbox.png")),),
                  const SizedBox(width: 60),
                  const Option(icon: "sun", screen: WeatherScreen()),
                ],
              ),
              const SizedBox(height: 60),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Option(icon: "about", screen: AboutMeScreen()),
                  SizedBox(width: 60),
                  Option(icon: "university", screen: UniversityScreen()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Option extends StatelessWidget {
  final String icon;
  final screen;
  final double sizeB;

  const Option( {
    super.key, 
    required this.icon, 
    this.screen = const MyApp(), 
    this.sizeB = 80});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(70))),
      width: sizeB,
      height: sizeB,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context)=>
              screen
            ));
        },
        child: Image(
          image: AssetImage("assets/$icon.png"),
        ),
      ),
      
      /*Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ),*/
    );
  }
}



class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Encabezado del Drawer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () {
              // Acción al tocar el ítem
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.abc),
            title: Text('Genero de nombre'),
            onTap: () {
              // Acción al tocar el ítem
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GenderScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.add_to_drive_outlined),
            title: Text('Edad de nombre'),
            onTap: () {
              // Acción al tocar el ítem
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AgeScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.no_flash),
            title: Text('Universidades de pais'),
            onTap: () {
              // Acción al tocar el ítem
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UniversityScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.zoom_out_map_sharp),
            title: Text('Clima en RD'),
            onTap: () {
              // Acción al tocar el ítem
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WeatherScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.add_alarm_rounded),
            title: Text('Noticias'),
            onTap: () {
              // Acción al tocar el ítem
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewsScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.confirmation_num),
            title: Text('Acerca de'),
            onTap: () {
              // Acción al tocar el ítem
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutMeScreen()));
            },
          ),
        ],
      ),
    );
  }
}
/*
class ToolBoxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Caja de herramientas en el centro
        Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: Text(
              'Caja',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
        const Positioned(
          child: BoxCenter(),
        )
        // Opciones alrededor de la caja en forma circular
      ],
    );
  }
}

class BoxCenter extends StatelessWidget {
  const BoxCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (int i = 0; i < 7; i++)
          Positioned(
            child: Option('Opción ${i + 1}'),
            // Distribución circular usando sin y cos
            left: 150 * cos(2 * pi * i / 6) +  150, // Ajusta el radio (150) y posición (140)
            top: 150 * sin(2 * pi * i / 6) + 600, // Ajusta el radio (150) y posición (140)
          ),
      ],
    );
  }
}
*/