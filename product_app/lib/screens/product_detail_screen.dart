import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import 'edit_product_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productId;
  const ProductDetailScreen({super.key, required this.productId});

 @override
Widget build(BuildContext context) {
  final product = Provider.of<ProductProvider>(context).getById(productId);

  if (product == null) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: const Center(
        child: Text('Product not found'),
      ),
    );
  }

  return Scaffold(
    appBar: AppBar(
      title: const Text('Product Details'),
      actions: [
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => EditProductScreen(product: product),
              ),
            );
          },
        )
      ],
    ),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name: ${product.name}', style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 10),
          Text('Price: ₹ ${product.price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 10),
          Text('Description:\n${product.description}', style: const TextStyle(fontSize: 16)),
        ],
      ),
    ),
  );
}
}
