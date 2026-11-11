
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/wishlist_controller.dart';

class WishlistView extends GetView<WishlistController> {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wishlist'),
        centerTitle: true,
      ),
      body: Obx(() {
        final products = controller.wishlistProducts;

        if (products.isEmpty) {
          return const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.favorite_border, size: 70, color: Colors.grey),
                SizedBox(height: 12),
                Text('Wishlist kamu masih kosong'),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];

            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: Image.network(
                  product.imageUrl,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.image_not_supported),
                ),
                title: Text(
                  product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(product.formattedPrice),
                onTap: () => controller.openDetail(product),
                trailing: PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'cart') {
                      controller.addToCart(product);
                    } else if (value == 'remove') {
                      controller.removeFromWishlist(product.id);
                    }
                  },
                  itemBuilder: (context) => const [
                    PopupMenuItem(
                      value: 'cart',
                      child: Text('Tambah ke Keranjang'),
                    ),
                    PopupMenuItem(
                      value: 'remove',
                      child: Text('Hapus dari Wishlist'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
