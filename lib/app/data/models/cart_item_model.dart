
import 'product_model.dart';

class CartItemModel {
  final String id;
  final ProductModel product;
  final int selectedSize;
  int quantity;

  CartItemModel({
    required this.id,
    required this.product,
    required this.selectedSize,
    this.quantity = 1,
  });

  int get subtotal => product.price * quantity;

  String get formattedSubtotal {
    final value = subtotal.toString();
    final result = StringBuffer();

    for (int i = 0; i < value.length; i++) {
      result.write(value[i]);

      final remaining = value.length - i - 1;
      if (remaining > 0 && remaining % 3 == 0) {
        result.write('.');
      }
    }

    return 'Rp$result';
  }
}
