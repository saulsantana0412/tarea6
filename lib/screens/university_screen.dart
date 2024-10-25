import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarea6/common/color_palette.dart';
import 'package:tarea6/models/university_model.dart';
import 'package:tarea6/services/university_service.dart';
import 'package:tarea6/widgets/my_appbar.dart';
import 'package:tarea6/widgets/my_card.dart'; // Importamos la Card personalizada

class UniversityScreen extends StatefulWidget {
  const UniversityScreen({super.key});

  @override
  State<UniversityScreen> createState() => _UniversityScreenState();
}

class _UniversityScreenState extends State<UniversityScreen> {
  final _formKey = GlobalKey<FormState>();
  final _countryController = TextEditingController(); // Input del país
  List<UniversityModel> universitiesList = [];

  Future<void> fetchUniversities(String country) async {
    universitiesList = await UniversityService.fetchUniversities(country);
    setState(() {}); // Actualiza la UI con las universidades obtenidas
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Buscar Universidades"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _countryController,
                  decoration: InputDecoration(
                    hintText: "Ingrese el nombre del país",
                    hintStyle: GoogleFonts.workSans(
                      fontSize: 20,
                      color: ColorPalette.gray,
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorPalette.green, width: 2.5),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un país';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      fetchUniversities(_countryController.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPalette.green,
                    textStyle: GoogleFonts.workSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    foregroundColor: Colors.white,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  child: const Text("Buscar Universidades"),
                ),
                const SizedBox(height: 40),
                Expanded(
                  child: ListView.builder(
                    itemCount: universitiesList.length,
                    itemBuilder: (context, index) {
                      return MyCard(
                        title: universitiesList[index].name,
                        url: universitiesList[index].url,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
