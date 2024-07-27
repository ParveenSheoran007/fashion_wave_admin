import 'dart:convert';
import 'package:fashion_wave_admin/product/model/product_model.dart';
import 'package:fashion_wave_admin/shared/api_end_point.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final String authToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNjY5NzRiYTRmZWUyM2RhZjMwMDRmYWE0IiwidXNlcm5hbWUiOiJyYW0ifSwiaWF0IjoxNzIyMDU1NDQ2LCJleHAiOjE3MjIwNTkwNDZ9.al-_9QKckRAowj80mOSCWdvnIaqur4NmSxpoQ10GzMY';

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(
      Uri.parse(ApiEndpoints.product),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      List<ProductModel> products =
          data.map((item) => ProductModel.fromJson(item)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<ProductModel> addProduct(ProductModel product) async {
    final response = await http.post(
      Uri.parse(ApiEndpoints.product),
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      body: json.encode({product.toJson()}),
    );

    if (response.statusCode == 201) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add product');
    }
  }

  Future<void> deleteProduct(String productId) async {
    try {
      final response = await http.delete(
        Uri.parse('${ApiEndpoints.product}/$productId'),
        headers: {
          'Authorization': 'Bearer $authToken',
        },
      );

      if (response.statusCode == 200) {
        print('Product deleted successfully');
      } else {
        print('Failed to delete product: ${response.body}');
        throw Exception('Failed to delete product');
      }
    } catch (error) {
      print('Failed to delete product: $error');
    }
  }

  Future<ProductModel> updateProduct(
      String productId, ProductModel product) async {
    final response = await http.put(
      Uri.parse('${ApiEndpoints.product}/$productId'),
      headers: {
        'Authorization': 'Bearer $authToken',
      },

      body: json.encode({product.toJson()}),
    );
    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update product');
    }
  }
}
