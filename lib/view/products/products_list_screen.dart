
import 'package:ecom/controller/product_riverpod.dart';
import 'package:ecom/controller/riverpod_management.dart';
import 'package:ecom/view/uils/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class ProductsListView extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(parsedProductsProvider); 
    final categories = Set<String>.from(products.map((product) => product.category)).toList();
    var read = ref.read(productRiverpod); 
    var watch = ref.watch(productRiverpod); 
      return  DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Products'),
          bottom: TabBar(
            tabs: categories.map((category) => Tab(text: category)).toList(),
          ),
        ),
        body: TabBarView(
          children: categories.map((category) {
            final filteredProducts = products.where((product) => product.category == category).toList();
            return ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
               if (watch.basketProducts.contains(product)) {
                  return SizedBox.shrink(); // Return empty container
                } else {
                  return ProductCard(
                    product: product,
                    setBasket: (product) => read.addedBasket(product), showAddToCartButton: true, 
                  );
                }
              },
            );
          }).toList(),
        ),
      ),
    );
 
}
}