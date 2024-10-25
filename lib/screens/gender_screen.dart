import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarea6/common/color_palette.dart';
import 'package:tarea6/services/gender_service.dart';
import 'package:tarea6/widgets/modal.dart';
import 'package:tarea6/widgets/my_appbar.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Genero de tu nombre"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(80),
          child: Form(  // Asegúrate de incluir el Form
            key: _formKey,
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
                          BorderSide(color: ColorPalette.yellow, width: 2.5),
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
                      return 'Por favor ingrese su nombre';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () async {
                    // Primero, valida el formulario completo
                    if (_formKey.currentState!.validate()) {
                      bool? gender = await GenderService.fetchGender(_nameController.text);
                      if (gender == true) {
                        MyModal.show(
                          context,
                          title: "Su nombre es para Masculinos",
                          image: const AssetImage("assets/masculino.jpg"),
                        );
                      } else if (gender == false) {
                        MyModal.show(
                          context,
                          title: "Su nombre es para Femeninas",
                          image: const AssetImage("assets/femenino.jpg"),
                        );
                      } else {
                        // Maneja el caso en que no se pudo determinar el género
                        MyModal.show(
                          context,
                          title: "No se pudo determinar el género",
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPalette.yellow,
                    textStyle: GoogleFonts.workSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    foregroundColor: ColorPalette.white,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: const Text("Comprueba el género"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
