
import 'package:get/get.dart';
import '../../../data/models/product_model.dart';
import '../../home/controllers/home_controller.dart';
import '../../cart/controllers/cart_controller.dart';

class DetailController extends GetxController {
  late ProductModel product;

  final quantity = 1.obs;
  final selectedSize = 42.obs;

  final homeController = Get.find<HomeController>();
  final cartController = Get.find<CartController>();

  @override
  void onInit() {
    super.onInit();
    product = Get.arguments as ProductModel;
  }

  void increaseQuantity() {
    quantity.value++;
  }

  void decreaseQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  void changeSize(int size) {
    selectedSize.value = size;
  }

  bool get isFavorite => homeController.isFavorite(product.id);

  void toggleFavorite() {
    homeController.toggleFavorite(product.id);
  }

  void addToCart() {
    cartController.addItem(
      product,
      size: selectedSize.value,
      quantity: quantity.value,
    );
  }
}
