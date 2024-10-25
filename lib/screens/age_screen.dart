import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarea6/common/color_palette.dart';
import 'package:tarea6/services/age_service.dart';
import 'package:tarea6/widgets/modal.dart';
import 'package:tarea6/widgets/my_appbar.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Edad de tu nombre"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Ingrese su nombre",
                  hintStyle: GoogleFonts.workSans(
                    fontSize: 20,
                    color: ColorPalette.gray,
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorPalette.gray, width: 2),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: ColorPalette.red, width: 2.5),
                  ),
                ),
                style: const TextStyle(
                  fontSize: 20,
                  color: ColorPalette.blueblack, // Cambia el color del texto
                  fontFamily: 'NuevaFuente', // Cambia la fuente del texto
                ),
                textAlign: TextAlign.center,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'por favor ingrese su nombre';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_nameController.text != '' ||
                      _formKey.currentState!.validate()) {
                    var age = await AgeService.getAge(_nameController.text);
                    if (age > 0) {
                      ButtonAction(age);
                    } else {
                      print('No se pudo obtener la edad.');
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorPalette.red,
                  textStyle: GoogleFonts.workSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  foregroundColor: ColorPalette.white,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text("Comprueba la Edad"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void ButtonAction(int age) {
    late List<List<String>> Stages = [
        ["Error"],
        ["Infancia", "assets/AgeStages/infancia.jpg"],
        ["Adolescencia", "assets/AgeStages/adolescencia.jpg"],
        ["Adultez joven", "assets/AgeStages/jovenes.jpg"],
        ["Edad Media", "assets/AgeStages/mediana.avif"],
        ["Adultez tardia", "assets/AgeStages/tardios.webp"],
        ["Vejez", "assets/AgeStages/vejez.jpg"],
      ];

    int IdentifyStage(int age) {
      if (age > 0 && age <= 12) return 1;
      if (age <= 18) return 2;
      if (age <= 39) return 3;
      if (age <= 59) return 4;
      if (age <= 79) return 5;
      if (age >= 80) return 6;
      return 0;
    }

    MyModal.show(
      context,
      title: "Su nombre esta en la ${Stages[IdentifyStage(age)][0]}",
      image: AssetImage(Stages[IdentifyStage(age)][1]),
      content: "Tiene " +age.toString()+"años"
    );
  }
}
