
import 'package:ecom/controller/product_riverpod.dart';
import 'package:ecom/view/uils/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class ProductsListView extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(parsedProductsProvider);   
      return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];             
                  return ProductCard(
                    product: product,
                    
                  );
                
              },
            );
  }
}
 