
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/home/bindings/home_binding.dart';
import 'app/modules/home/views/home_view.dart';

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
      home: const HomeView(),
    );
  }
}
