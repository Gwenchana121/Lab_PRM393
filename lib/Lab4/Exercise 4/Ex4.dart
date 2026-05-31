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

      // Theme customization
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),

      home: Scaffold(
        appBar: AppBar(
          title: const Text("Exercise 4"),
          actions: [
            const Text("Dark"),
            Switch(
              value: false,
              onChanged: null, // Chỉ hiển thị, chưa xử lý
            ),
          ],
        ),

        body: const Center(
          child: Text(
            "This is a simple screen with theme toggle.",
            style: TextStyle(fontSize: 16),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}