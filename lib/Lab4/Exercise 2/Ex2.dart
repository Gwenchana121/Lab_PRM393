import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Exercise 2")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Rating (Slider)"),

              Slider(
                value: 50,
                min: 0,
                max: 100,
                onChanged: null,
              ),

              const Text("Current value: 50"),

              const SizedBox(height: 20),

              const Text("Active (Switch)"),

              Switch(
                value: false,
                onChanged: null,
              ),

              const SizedBox(height: 20),

              const Text("Genre (RadioListTile)"),

              RadioListTile(
                title: Text("Action"),
                value: "Action",
                groupValue: null,
                onChanged: null,
              ),

              RadioListTile(
                title: Text("Comedy"),
                value: "Comedy",
                groupValue: null,
                onChanged: null,
              ),

              const Text("Selected genre: None"),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: null,
                child: Text("Open Date Picker"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}