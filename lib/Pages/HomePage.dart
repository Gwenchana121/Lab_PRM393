import 'package:flutter/material.dart';
import '../Widgets/ProductWidget.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        title: Center(child: Text("Home Page")),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),

        ],
      ),
      body: ProductWidget(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Mục đang được chọn mặc định
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About',
          ),
        ],
      ),
    );
  }
}
// --- Thêm đoạn code này vào cuối file HomePage.dart ---
void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(), // Chạy ngay chính trang này làm màn hình chính
    ),
  );
}