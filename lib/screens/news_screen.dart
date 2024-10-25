import 'package:flutter/material.dart';
import 'package:tarea6/models/new_model.dart';
import 'package:tarea6/services/news_service.dart';
import 'package:tarea6/widgets/my_appbar.dart';
import 'package:tarea6/widgets/my_card.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<NewModel> newsList = [];

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    newsList = await NewsService.getNews();
    for (var element in newsList) {
      print(element.name);
    }
    setState(() {}); // Update the UI after fetching the news
    // Update the UI after fetching the news
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Noticias CNN"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            return MyCard(title: newsList[index].name, description: newsList[index].description, url: newsList[index].url);
          },
        ),
      ),
    );
  }
}
