import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  final String baseUrl = 'http://localhost:3000/products'; // Use 10.0.2.2 for Android emulator

  // GET - Fetch all products
  Future<void> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _products = data.map((item) => Product.fromJson(item)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print("Error fetching products: $e");
    }
  }

  // POST - Add a new product
  Future<void> addProduct(Product product) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(product.toJson()),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final newProduct = Product.fromJson(json.decode(response.body));
        _products.add(newProduct);
        notifyListeners();
      } else {
        throw Exception('Failed to add product');
      }
    } catch (e) {
      print("Error adding product: $e");
    }
  }

  // GET - Fetch single product by id
  Product getById(String id) {
    return _products.firstWhere((product) => product.id == id);
  }

  // PUT - Update a product
  Future<void> updateProduct(String id, Product updatedProduct) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(updatedProduct.toJson()),
      );

      if (response.statusCode == 200) {
        final index = _products.indexWhere((p) => p.id == id);
        if (index != -1) {
          _products[index] = updatedProduct;
          notifyListeners();
        }
      } else {
        throw Exception('Failed to update product');
      }
    } catch (e) {
      print("Error updating product: $e");
    }
  }

  // DELETE - Remove a product
  Future<void> deleteProduct(String id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/$id'));

      if (response.statusCode == 200) {
        _products.removeWhere((product) => product.id == id);
        notifyListeners();
      } else {
        throw Exception('Failed to delete product');
      }
    } catch (e) {
      print("Error deleting product: $e");
    }
  }
}
