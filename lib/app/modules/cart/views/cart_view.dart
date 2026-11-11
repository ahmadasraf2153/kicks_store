
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  String rupiah(num value) {
    return 'Rp${value.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => '.',
    )}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang Belanja'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.items.isEmpty) {
          return const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.shopping_cart_outlined, size: 70),
                SizedBox(height: 12),
                Text('Keranjang masih kosong'),
              ],
            ),
          );
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ...controller.items.map((item) {
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Image.network(
                        item.product.imageUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.image_not_supported),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.product.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Ukuran: ${item.selectedSize}'),
                            Text(item.product.formattedPrice),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () =>
                                      controller.decreaseQuantity(item.id),
                                  icon: const Icon(Icons.remove_circle_outline),
                                ),
                                Text('${item.quantity}'),
                                IconButton(
                                  onPressed: () =>
                                      controller.increaseQuantity(item.id),
                                  icon: const Icon(Icons.add_circle_outline),
                                ),
                              ],
                            ),
                            Text(
                              'Subtotal: ${item.formattedSubtotal}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => controller.removeItem(item.id),
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 16),
            const Text(
              'Ringkasan Belanja',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _summaryRow('Subtotal', rupiah(controller.subtotal)),
            _summaryRow('Pajak (11%)', rupiah(controller.tax)),
            _summaryRow('Ongkir', rupiah(controller.shippingFee)),
            const Divider(),
            _summaryRow(
              'Total',
              rupiah(controller.totalAmount),
              bold: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  'KicksStore',
                  'Fitur checkout belum tersedia.',
                );
              },
              child: const Text('Checkout'),
            ),
          ],
        );
      }),
    );
  }

  Widget _summaryRow(String title, String value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
