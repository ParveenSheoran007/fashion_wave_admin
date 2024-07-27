import 'package:fashion_wave_admin/product/model/product_model.dart';
import 'package:fashion_wave_admin/product/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductUpdateScreen extends StatefulWidget {
  const ProductUpdateScreen(
      {super.key,required this.productModel});


  final ProductModel productModel;

  @override
  ProductUpdateScreenState createState() => ProductUpdateScreenState();
}

class ProductUpdateScreenState extends State<ProductUpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController editNameController = TextEditingController();
  late TextEditingController editPriceController = TextEditingController();
  late TextEditingController editDescriptionController = TextEditingController();
  late TextEditingController editCategoryController = TextEditingController();
  late ProductProvider productProvider;

  @override
  void initState() {
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    editNameController = TextEditingController(text: widget.productModel.name);
    editPriceController = TextEditingController(text: widget.productModel.price);
    editDescriptionController = TextEditingController(text: widget.productModel.description);
    editCategoryController = TextEditingController(text: widget.productModel.category);
    super.initState();
  }

  @override
  void dispose() {
    editNameController.dispose();
    editPriceController.dispose();
    editDescriptionController.dispose();
    editCategoryController.dispose();
    super.dispose();
  }

  // void _submitForm() {
  //   if (_formKey.currentState!.validate()) {
  //     final name = _nameController.text;
  //     final price = double.tryParse(_priceController.text) ?? 0.0;
  //     // Add product using the provider
  //     Provider.of<ProductProvider>(context, listen: false).addProduct(name as ProductModel, price);
  //     Navigator.pop(context);
  //   }
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: editNameController,
                decoration: const InputDecoration(labelText: 'Product Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a product name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: editPriceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: editDescriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: editCategoryController,
                decoration: const InputDecoration(labelText: 'Category'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  ProductModel productModel = ProductModel(
                    name: editNameController.text,
                    price: editPriceController.text,
                    description: editDescriptionController.text,
                    category: editCategoryController.text,
                  );
                  await productProvider.updateProduct(widget.productModel.id!,productModel);
                },
                child: const Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
