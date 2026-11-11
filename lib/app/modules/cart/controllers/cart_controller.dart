
import 'package:get/get.dart';
import '../../../data/models/cart_item_model.dart';
import '../../../data/models/product_model.dart';

class CartController extends GetxController {
  final items = <CartItemModel>[].obs;

  // Jumlah seluruh barang
  int get totalItemCount =>
      items.fold(0, (total, item) => total + item.quantity);

  // Total harga produk
  int get subtotal =>
      items.fold(0, (total, item) => total + item.subtotal);

  // Pajak 11%
  int get tax => (subtotal * 0.11).round();

  // Ongkir gratis jika belanja minimal Rp2.000.000
  int get shippingFee => subtotal >= 2000000 ? 0 : 25000;

  // Total pembayaran
  int get totalAmount => subtotal + tax + shippingFee;

  // Tambahkan produk ke keranjang
  void addItem(
    ProductModel product, {
    required int size,
    int quantity = 1,
  }) {
    final index = items.indexWhere(
      (item) =>
          item.product.id == product.id &&
          item.selectedSize == size,
    );

    if (index != -1) {
      items[index].quantity += quantity;
      items.refresh();
    } else {
      items.add(
        CartItemModel(
          id: '${product.id}-$size',
          product: product,
          selectedSize: size,
          quantity: quantity,
        ),
      );
    }

    Get.snackbar(
      'Berhasil!',
      '${product.name} ditambahkan ke keranjang.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Tambah jumlah
  void increaseQuantity(String id) {
    final item = items.firstWhere((item) => item.id == id);
    item.quantity++;
    items.refresh();
  }

  // Kurangi jumlah
  void decreaseQuantity(String id) {
    final item = items.firstWhere((item) => item.id == id);

    if (item.quantity > 1) {
      item.quantity--;
      items.refresh();
    }
  }

  // Hapus produk
  void removeItem(String id) {
    items.removeWhere((item) => item.id == id);
  }

  // Kosongkan keranjang
  void clearCart() {
    items.clear();
  }
}
