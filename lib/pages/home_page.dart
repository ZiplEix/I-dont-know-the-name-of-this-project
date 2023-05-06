import 'package:flutter/material.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_blog/pages/article_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (backgroundColor == Colors.white) {
                backgroundColor = Colors.redAccent;
              } else {
                backgroundColor = Colors.white;
              }
              setState(() {
                backgroundColor = backgroundColor;
              });
            },
            icon: const Icon(Icons.color_lens),
          ),
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: ListTile(
                  title: Text(
                    "Flutter Blog",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.settings),
                title: const Text(
                  "Settings",
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                leading: const Icon(Icons.logout),
                title: const Text(
                  "Logout",
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Wrap(
                spacing: 10,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      shape: const StadiumBorder(),
                    ),
                    child: const Text("Money"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      shape: const StadiumBorder(),
                    ),
                    child: const Text("Crypto"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      shape: const StadiumBorder(),
                    ),
                    child: const Text("Stock market"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      shape: const StadiumBorder(),
                    ),
                    child: const Text("House market"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      shape: const StadiumBorder(),
                    ),
                    child: const Text("Diamonds Hands"),
                  ),
                ],
              ),
            ),
            const ArticleCard(
              imagePath: 'assets/travel.png',
              text: "How to get rich",
            ),
            const ArticleCard(
              imagePath: 'assets/door.png',
              text: "Should you buy an house ?",
            ),
            const ArticleCard(
              imagePath: 'assets/app.png',
              text: "How to make an app",
            ),
            const ArticleCard(
              imagePath: 'assets/space.png',
              text: "Stock Market",
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.imagePath,
    required this.text,
  });

  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                ArticlePage(imagePath: imagePath, title: text),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(2, 2),
              ),
            ]),
        child: Column(
          children: [
            Image.asset(imagePath),
            ListTile(
              title: Text(text),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
