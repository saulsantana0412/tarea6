import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Para poder abrir la URL en el navegador

class MyCard extends StatelessWidget {
  final String title;
  final String url;
  final String? description;

  const MyCard({
    Key? key,
    required this.title,
    required this.url,
    this.description,
  }) : super(key: key);

  // Función para abrir la URL
  void _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (description != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  description!,
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _launchURL,
              child: Text('Open URL'),
            ),
          ],
        ),
      ),
    );
  }
}
