import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../models/product_model.dart';
import 'cart_page.dart';

class ProductList extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  final List<Product> products = [
    Product(name: 'Laptop', price: 100000.0),
    Product(name: 'Phone', price: 50000.0),
    Product(name: 'Headphones', price: 8000.0),
    Product(name: 'Mouse', price: 1500.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Get.to(() => CartPage());
            },
          ),
        ],
        backgroundColor: Colors.pink[300],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(product.name),
              subtitle: Text('Rs. ${product.price.toStringAsFixed(0)}'),
              trailing: ElevatedButton(
                onPressed: () {
                  cartController.addToCart(product);
                  Get.snackbar(
                    'Added to Cart',
                    '${product.name} has been added!',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                ),
                child: const Text('Add'),
              ),
            ),
          );
        },
      ),
    );
  }
}
