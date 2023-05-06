import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ArticlePage extends StatefulWidget {
  const ArticlePage({
    super.key,
    required this.imagePath,
    required this.title,
  });

  final String imagePath;
  final String title;

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late String _descriptionData = "";

  getDescription() async {
    final description = await http.get(Uri.parse(
        "https://baconipsum.com/api/?type=all-meat&paras=5&start-with-lorem=1"));

    String descriptionData = utf8.decode(description.bodyBytes);

    descriptionData = descriptionData.replaceAll("[\"", "");
    descriptionData = descriptionData.replaceAll("\"]", "");
    descriptionData = descriptionData.replaceAll("\",\"", "\n");

    setState(() {
      _descriptionData = descriptionData;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDescription();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(widget.imagePath),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              _descriptionData == ""
                  ? const CircularProgressIndicator()
                  : Text(
                      _descriptionData,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.justify,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
