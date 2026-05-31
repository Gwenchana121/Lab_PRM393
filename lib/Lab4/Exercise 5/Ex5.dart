import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Exercise 5"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Correct ListView inside Column using Expanded",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Expanded(
                    child: ListView(
                      children: const [
                        ListTile(
                          leading: Icon(Icons.movie),
                          title: Text("Movie A"),
                        ),
                        ListTile(
                          leading: Icon(Icons.movie),
                          title: Text("Movie B"),
                        ),
                        ListTile(
                          leading: Icon(Icons.movie),
                          title: Text("Movie C"),
                        ),
                        ListTile(
                          leading: Icon(Icons.movie),
                          title: Text("Movie D"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}