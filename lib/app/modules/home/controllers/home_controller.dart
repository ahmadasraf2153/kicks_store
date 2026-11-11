
import 'package:get/get.dart';
import '../../../data/models/product_model.dart';
import '../../cart/controllers/cart_controller.dart';

class HomeController extends GetxController {
  final selectedCategory = 'Semua'.obs;
  final favoriteIds = <String>{}.obs;

  final categories = <String>[
    'Semua',
    'Running',
    'Casual',
    'Basketball',
    'Lifestyle',
  ];

  final products = <ProductModel>[
    ProductModel(
      id: 'shoe-01',
      name: 'Nike Air Jordan 1 High OG',
      category: 'Basketball',
      price: 2499000,
      rating: 4.9,
      reviewCount: 312,
      imageUrl: 'https://images.unsplash.com/photo-1552346154-21d32810aba3?auto=format&fit=crop&w=800&q=80',
      description: 'Sepatu legendaris dengan material kulit premium, bantalan Air-Sole klasik, dan sol traksi karet tangguh.',
    ),
    ProductModel(
      id: 'shoe-02',
      name: 'Adidas Ultraboost Light 23',
      category: 'Running',
      price: 3100000,
      rating: 4.8,
      reviewCount: 195,
      imageUrl: 'https://images.unsplash.com/photo-1584735935682-2f2b69dff9d2?auto=format&fit=crop&w=800&q=80',
      description: 'Sepatu lari responsif dengan teknologi bantalan Light BOOST.',
    ),
    ProductModel(
      id: 'shoe-03',
      name: 'Puma Slipstream Retro Bball',
      category: 'Casual',
      price: 1499000,
      rating: 4.7,
      reviewCount: 84,
      imageUrl: 'https://images.unsplash.com/photo-1608231387042-66d1773070a5?auto=format&fit=crop&w=800&q=80',
      description: 'Siluet basket era 80-an dengan sentuhan modern.',
    ),
    ProductModel(
      id: 'shoe-04',
      name: 'New Balance 550 Vintage White',
      category: 'Casual',
      price: 2099000,
      rating: 4.9,
      reviewCount: 420,
      imageUrl: 'https://images.unsplash.com/photo-1539185441755-769473a23570?auto=format&fit=crop&w=800&q=80',
      description: 'Desain clean dan vintage yang mudah dipadukan.',
    ),
    ProductModel(
      id: 'shoe-05',
      name: 'Nike ZoomX Vaporfly Next% 3',
      category: 'Running',
      price: 3899000,
      rating: 5.0,
      reviewCount: 118,
      imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=800&q=80',
      description: 'Sepatu lari dengan pelat serat karbon dan busa ZoomX.',
    ),
    ProductModel(
      id: 'shoe-06',
      name: 'Converse Chuck 70 Canvas High',
      category: 'Lifestyle',
      price: 999000,
      rating: 4.8,
      reviewCount: 560,
      imageUrl: 'https://images.unsplash.com/photo-1607522370275-f14206abe5d3?auto=format&fit=crop&w=800&q=80',
      description: 'Siluet Chuck Taylor klasik dengan kanvas premium.',
    ),
  ];

  CartController get cartController => Get.find<CartController>();

  int get cartCount => cartController.totalItemCount;

  List<ProductModel> get filteredProducts {
    if (selectedCategory.value == 'Semua') {
      return products;
    }

    return products
        .where((item) => item.category == selectedCategory.value)
        .toList();
  }

  void changeCategory(String category) {
    selectedCategory.value = category;
  }

  void addToCart(ProductModel product) {
    cartController.addItem(product, size: 42);
  }

  void toggleFavorite(String productId) {
    if (favoriteIds.contains(productId)) {
      favoriteIds.remove(productId);
    } else {
      favoriteIds.add(productId);

      Get.snackbar(
        'Disimpan ke Wishlist',
        'Sepatu berhasil ditambahkan ke daftar favorit!',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  bool isFavorite(String productId) =>
      favoriteIds.contains(productId);

  void openDetail(ProductModel product) {
    Get.toNamed('/detail', arguments: product);
  }
}
