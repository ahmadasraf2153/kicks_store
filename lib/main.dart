
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/modules/home/bindings/home_binding.dart';
import 'app/modules/home/views/home_view.dart';

import 'app/modules/detail/bindings/detail_binding.dart';
import 'app/modules/detail/views/detail_view.dart';

import 'app/modules/cart/bindings/cart_binding.dart';
import 'app/modules/cart/views/cart_view.dart';

import 'app/modules/wishlist/bindings/wishlist_binding.dart';
import 'app/modules/wishlist/views/wishlist_view.dart';

void main() {
  runApp(const KicksStoreApp());
}

class KicksStoreApp extends StatelessWidget {
  const KicksStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KicksStore',
      initialBinding: HomeBinding(),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomeView(),
        ),
        GetPage(
          name: '/detail',
          page: () => const DetailView(),
          binding: DetailBinding(),
        ),
        GetPage(
          name: '/cart',
          page: () => const CartView(),
          binding: CartBinding(),
        ),
        GetPage(
          name: '/wishlist',
          page: () => const WishlistView(),
          binding: WishlistBinding(),
        ),
      ],
    );
  }
}
