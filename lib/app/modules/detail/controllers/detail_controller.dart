
import 'package:get/get.dart';
import '../../home/controllers/home_controller.dart';

class DetailController extends GetxController {
  late Map<String, dynamic> product;

  final quantity = 1.obs;
  final selectedSize = 42.obs;

  final homeController = Get.find<HomeController>();

  @override
  void onInit() {
    super.onInit();
    product = Get.arguments as Map<String, dynamic>;
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

  bool get isFavorite =>
      homeController.isFavorite(product['id']);

  void toggleFavorite() {
    homeController.toggleFavorite(product['id']);
  }

  void addToCart() {
    homeController.cartCount.value += quantity.value;

    Get.snackbar(
      'Berhasil!',
      '${quantity.value} ${product['name']} ditambahkan ke keranjang.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
