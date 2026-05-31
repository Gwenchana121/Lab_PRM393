

import 'package:flutter/material.dart';

void main() {
  runApp(const CoreWidgetsApp());
}


class CoreWidgetsApp extends StatelessWidget {
  const CoreWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Exercise 1 – Core Widgets Demo',
      debugShowCheckedModeBanner: false,
      home: CoreWidgetsDemoScreen(),
    );
  }
}


class CoreWidgetsDemoScreen extends StatelessWidget {
  const CoreWidgetsDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('Exercise 1 – Core Widge...'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 1. Text Widget
            const Text(
              'Welcome to Flutter UI',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 16),

            //2. Icon Widget
            const Icon(
              Icons.movie_creation,
              size: 64,
              color: Colors.blue,
            ),

            const SizedBox(height: 16),

            //  3. Image.network
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(

                'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=600',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 180,
                    color: Colors.grey[200],
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 180,
                    color: Colors.grey[200],
                    alignment: Alignment.center,
                    child: const Icon(Icons.broken_image, size: 48, color: Colors.grey),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            // 4. Card chứa ListTile
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: const ListTile(
                leading: Icon(Icons.star, color: Colors.black87),
                title: Text(
                  'Movie Item',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('This is a sample ListTile inside a Card.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}