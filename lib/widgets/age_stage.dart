import 'package:flutter/material.dart';

class AgeStage extends StatefulWidget {
  final int stage;

  AgeStage({super.key, required this.stage});

  @override
  State<AgeStage> createState() => _AgeStageState();
}

class _AgeStageState extends State<AgeStage> {
  late List<List<String>> Stages = [
    ["Error"],
    ["Infancia", "assets/AgeStages/infancia.jpg"],
    ["Adolescencia", "assets/AgeStages/adolescencia.jpg"],
    ["Adultez joven", "assets/AgeStages/jovenes.jpg"],
    ["Edad Media", "assets/AgeStages/mediana.avif"],
    ["Adultex tardia", "assets/AgeStages/tardios.webp"],
    ["Vejez", "assets/AgeStages/vejez.jpg"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Container(
      child: Image.asset(Stages[widget.stage][1]),
      ),
    ); 
    
  }
}