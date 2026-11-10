
import 'package:get/get.dart';

class HomeController extends GetxController {
  final selectedCategory = 0.obs;

  final categories = [
    'All',
    'Sneakers',
    'Running',
    'Casual',
  ];

  final products = [
    
    {
      'name': 'Nike Air Max',
      'price': 'Rp1.500.000',
      'category': 'Sneakers',
      'image': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500',
    },
    {
      'name': 'Adidas Ultraboost',
      'price': 'Rp1.800.000',
      'category': 'Running',
      'image': 'https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=500',
    },
    {
      'name': 'New Balance 574',
      'price': 'Rp1.200.000',
      'category': 'Casual',
      'image': 'https://images.unsplash.com/photo-1539185441755-769473a23570?w=500',
    },
  ];

  
  List<Map<String, String>> get filteredProducts {
    if (selectedCategory.value == 0) {
      return products;
    }

    final category = categories[selectedCategory.value];

    return products
        .where((product) => product['category'] == category)
        .toList();
  }

  void changeCategory(int index) {
    selectedCategory.value = index;
  }
}


