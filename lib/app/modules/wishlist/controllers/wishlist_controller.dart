
import 'package:get/get.dart';
import '../../../data/models/product_model.dart';
import '../../home/controllers/home_controller.dart';
import '../../cart/controllers/cart_controller.dart';

class WishlistController extends GetxController {
  final homeController = Get.find<HomeController>();
  final cartController = Get.find<CartController>();

  List<ProductModel> get wishlistProducts {
    return homeController.products
        .where((product) => homeController.isFavorite(product.id))
        .toList();
  }

  void removeFromWishlist(String id) {
    homeController.toggleFavorite(id);
  }

  void addToCart(ProductModel product) {
    cartController.addItem(product, size: 42);
  }

  void openDetail(ProductModel product) {
    homeController.openDetail(product);
  }
}
