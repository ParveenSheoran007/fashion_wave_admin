import 'dart:convert';
import 'package:fashion_wave_admin/product/model/product_model.dart';
import 'package:fashion_wave_admin/shared/api_end_point.dart';
import 'package:http/http.dart' as http;

class ProductService {
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
        'Content-Type': 'application/json',
      },
      body: json.encode(product.toJson()),
    );

    if (response.statusCode == 201) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add product');
    }
  }

  Future<void> deleteProduct(String productId) async {
    final response = await http.delete(
      Uri.parse('${ApiEndpoints.product}/$productId'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete product');
    }
  }

  Future<ProductModel> updateProduct(String productId, ProductModel product) async {
    final response = await http.put(
      Uri.parse('${ApiEndpoints.product}/$productId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-1',
      },
      body: jsonEncode(product.toJson()),
    );

    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update product');
    }
  }}
