
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final product = controller.product;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
              title: const Text('Detail Produk'),
              backgroundColor: const Color(0xFF172554),
              foregroundColor: Colors.white,
              actions: [
                Obx(() => IconButton(
                      onPressed: controller.toggleFavorite,
                      icon: Icon(
                        controller.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: controller.isFavorite ? Colors.red : Colors.white,
                      ),
                    )),
              ],
            ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                product['imageUrl'],
                width: double.infinity,
                height: 280,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.shopping_bag, size: 80),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product['name'],
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Rp${product['price']}',
              style: const TextStyle(
                fontSize: 20,
                color: Color(0xFF1D4ED8),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              product['description'],
              style: const TextStyle(fontSize: 15, height: 1.5),
            ),
            const SizedBox(height: 24),
            const Text(
              'Pilih Ukuran',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Obx(() => Wrap(
                  spacing: 10,
                  children: [39, 40, 41, 42, 43, 44].map((size) {
                    final selected = controller.selectedSize.value == size;

                    return ChoiceChip(
                      label: Text('$size'),
                      selected: selected,
                      onSelected: (_) => controller.changeSize(size),
                    );
                  }).toList(),
                )),
            const SizedBox(height: 24),
            const Text(
              'Jumlah',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Obx(() => Row(
                  children: [
                    IconButton(
                      onPressed: controller.decreaseQuantity,
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
                    Text(
                      '${controller.quantity.value}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: controller.increaseQuantity,
                      icon: const Icon(Icons.add_circle_outline),
                    ),
                  ],
                )),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.addToCart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF172554),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                ),
                child: const Text('Tambah ke Keranjang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
