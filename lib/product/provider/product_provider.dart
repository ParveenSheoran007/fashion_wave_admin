import 'package:fashion_wave_admin/product/model/product_model.dart';
import 'package:fashion_wave_admin/product/service/product_service.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  final ProductService productService = ProductService();

  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _products = await productService.fetchProducts();
      print('Products loaded: ${_products.length}');
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addProduct(ProductModel product, double price) async {
    _isLoading = true;
    notifyListeners();

    try {
      final newProduct = await productService.addProduct(product);
      _products.add(newProduct);
    } catch (error) {
      print('Failed to add product: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteProduct(String productId) async {
    _isLoading = true;
    notifyListeners();

    try {
      await productService.deleteProduct(productId);
      _products.removeWhere((product) => product.id == productId);
    } catch (error) {
      print('Failed to delete product: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateProduct(String productId, ProductModel product) async {
    _isLoading = true;
    notifyListeners();
    try {
      final updatedProduct = await productService.updateProduct(productId, product);
      final index = _products.indexWhere((p) => p.id == productId);
      if (index != -1) {
        _products[index] = updatedProduct;
      }
    } catch (error) {
      print('Failed to update product: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }}
