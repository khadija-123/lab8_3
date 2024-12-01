import 'package:get/get.dart';
import '../models/product_model.dart';

class CartController extends GetxController {
  // List of products in the cart
  var cartItems = <Product>[].obs;

  // Add a product to the cart
  void addToCart(Product product) {
    cartItems.add(product);
  }

  // Remove a product from the cart
  void removeFromCart(Product product) {
    cartItems.remove(product);
  }

  // Get total price of the cart
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
}
