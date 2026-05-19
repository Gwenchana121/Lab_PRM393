import 'dart:io';

class Product{
  int id;
  String name;
  String image;
  double price;

  Product({required  this.id,required  this.name,required  this.image,required  this.price});

  static List<Product> products = [
    Product(id: 1, name: 'iPhone 15',    image: 'iphone15.png',  price: 100000),
    Product(id: 2, name: 'Samsung Galaxy S24',image: 'samsung_s24.png',price: 200000),
    Product(id: 3, name: 'MacBook Air M3',   image: 'macbook_m3.png', price: 300000),
    Product(id: 4, name: 'iPad Pro',    image: 'ipad_pro.png',   price: 400000),
    Product(id: 5, name: 'AirPods Pro',      image: 'airpods.png',    price: 500000),
  ];

  @override
  String toString() {
    return 'Product { id: $id, name: $name, image: $image, price: $price }';
  }

  static void displayAll() {
    print('\n====== DANH SÁCH SẢN PHẨM ======');
    if (products.isEmpty) {
      print('Danh sách trống!');
      return;
    }
    for (var p in products) {
      print(p);
    }
    print('=================================\n');
  }

  /// Sắp xếp theo giá tăng dần
  static void sortByPriceAsc() {
    products.sort((a, b) => a.price.compareTo(b.price));
    print('✔ Đã sắp xếp theo giá TĂNG DẦN');
  }

  /// Sắp xếp theo giá giảm dần
  static void sortByPriceDesc() {
    products.sort((a, b) => b.price.compareTo(a.price));
    print('✔ Đã sắp xếp theo giá GIẢM DẦN');
  }

  /// Sắp xếp theo tên A → Z
  static void sortByNameAsc() {
    products.sort((a, b) => a.name.compareTo(b.name));
    print('✔ Đã sắp xếp theo tên A → Z');
  }


  /// Thêm sản phẩm mới vào danh sách
  static void addProduct(Product newProduct) {
    // Kiểm tra ID trùng lặp
    bool idExists = products.any((p) => p.id == newProduct.id);
    if (idExists) {
      print(' Lỗi: ID ${newProduct.id} đã tồn tại!');
      return;
    }
    products.add(newProduct);
    print('✔ Đã thêm sản phẩm: ${newProduct.name}');
  }


  /// Xóa sản phẩm theo ID
  static void deleteById(int id) {
    int index = products.indexWhere((p) => p.id == id);
    if (index == -1) {
      print(' Không tìm thấy sản phẩm có ID: $id');
      return;
    }
    String deletedName = products[index].name;
    products.removeAt(index);
    print('✔ Đã xóa sản phẩm: $deletedName (ID: $id)');
  }


  /// Cập nhật thông tin sản phẩm theo ID

  static void updateById({
    required int id,
    String? name,
    String? image,
    double? price,
  }) {
    int index = products.indexWhere((p) => p.id == id);
    if (index == -1) {
      print(' Không tìm thấy sản phẩm có ID: $id');
      return;
    }
    if (name  != null) products[index].name  = name;
    if (image != null) products[index].image = image;
    if (price != null) products[index].price = price;
    print('✔ Đã cập nhật sản phẩm ID $id: ${products[index]}');
  }

  /// Tìm kiếm theo ID
  static Product? findById(int id) {
    try {
      return products.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  /// Tìm kiếm theo tên
  static List<Product> findByName(String keyword) {
    String kw = keyword.toLowerCase();
    return products.where((p) => p.name.toLowerCase().contains(kw)).toList();
  }
}

void main() {
  bool running = true;

  while (running) {
    print('\n========== MENU SẢN PHẨM ==========');
    print('1. Hiển thị danh sách');
    print('2. Thêm sản phẩm');
    print('3. Xóa sản phẩm');
    print('4. Sửa sản phẩm');
    print('5. Tìm theo ID');
    print('6. Tìm theo tên');
    print('7. Sắp xếp theo giá tăng dần');
    print('8. Sắp xếp theo giá giảm dần');
    print('9. Sắp xếp theo tên A→Z');
    print('0. Thoát');
    print('====================================');
    stdout.write('Chọn chức năng: ');

    String? input = stdin.readLineSync();
    int choice = int.tryParse(input ?? '') ?? -1;

    switch (choice) {
      case 1:
        Product.displayAll();
        break;

      case 2:
        stdout.write('Nhập ID: ');
        int id = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
        stdout.write('Nhập tên: ');
        String name = stdin.readLineSync() ?? '';
        stdout.write('Nhập image: ');
        String image = stdin.readLineSync() ?? '';
        stdout.write('Nhập giá: ');
        double price = double.tryParse(stdin.readLineSync() ?? '') ?? 0;
        Product.addProduct(Product(id: id, name: name, image: image, price: price));
        break;

      case 3:
        stdout.write('Nhập ID cần xóa: ');
        int id = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
        Product.deleteById(id);
        break;

      case 4:
        stdout.write('Nhập ID cần sửa: ');
        int id = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
        stdout.write('Nhập tên mới (Enter để bỏ qua): ');
        String? name = stdin.readLineSync();
        stdout.write('Nhập giá mới (Enter để bỏ qua): ');
        String? priceInput = stdin.readLineSync();
        double? price = double.tryParse(priceInput ?? '');
        Product.updateById(
          id: id,
          name: name!.isEmpty ? null : name,
          price: price,
        );
        break;

      case 5:
        stdout.write('Nhập ID cần tìm: ');
        int id = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
        Product? found = Product.findById(id);
        print(found != null ? found : 'Không tìm thấy!');
        break;

      case 6:
        stdout.write('Nhập tên cần tìm: ');
        String keyword = stdin.readLineSync() ?? '';
        List<Product> results = Product.findByName(keyword);
        if (results.isEmpty) {
          print('Không tìm thấy sản phẩm nào!');
        } else {
          results.forEach(print);
        }
        break;

      case 7:
        Product.sortByPriceAsc();
        Product.displayAll();
        break;

      case 8:
        Product.sortByPriceDesc();
        Product.displayAll();
        break;

      case 9:
        Product.sortByNameAsc();
        Product.displayAll();
        break;

      case 0:
        print('Thoát chương trình!');
        running = false;
        break;

      default:
        print('Lựa chọn không hợp lệ, vui lòng thử lại!');
    }
  }
}