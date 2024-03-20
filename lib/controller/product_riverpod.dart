import 'dart:convert';
import 'package:ecom/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riverpod/riverpod.dart';

 final productsProvider = FutureProvider<String>((ref) async {
  return await rootBundle.loadString('assets/products.json');
});

 final parsedProductsProvider = Provider<List<ProductModel>>((ref) {
  final jsonString = ref.watch(productsProvider).asData?.value;
  if (jsonString != null) {
    final jsonData = json.decode(jsonString);
    return List<ProductModel>.from(jsonData['products'].map((x) => ProductModel(
      category: x['category'],
      name: x['name'],
      price: x['price'].toDouble(),
      description: x['description'],
      imagePath: x['image_path'],
    )));
  }
  return [];
});
class ProductRiverpod extends ChangeNotifier {
   List<ProductModel> basketProducts = [];


  void addedBasket(ProductModel model) {
    basketProducts.add(model);
    
    notifyListeners();
  }

  void deleteBasket(ProductModel model) {
    basketProducts.remove(model);
    
    notifyListeners();
  }
  
  
}
