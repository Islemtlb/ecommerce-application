
import 'package:ecom/controller/riverpod_management.dart';
import 'package:ecom/view/uils/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:grock/grock.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BasketScreen extends ConsumerWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var product = ref.watch(productRiverpod);
    int totalCartItems = product.basketProducts.length;
     

    return Scaffold(
      body: product.basketProducts.length == 0
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Cart is empty"),
                ],
              ),
            )
          : ListView(
              children: [
                GrockList(
                  shrinkWrap: true,
                  itemCount: product.basketProducts.length,
                  scrollEffect: const NeverScrollableScrollPhysics(),
                  padding: [20, 10].horizontalAndVerticalP,
                  itemBuilder: (context, index) {
                    return Slidable(
                      startActionPane: ActionPane(
                        motion: const DrawerMotion(),
                        children: [
                          SlidableAction(
                            autoClose: true,
                            flex: 1,
                            onPressed: (value) {
                              product.deleteBasket(
                                  product.basketProducts[index]); // Slide card  right to delete product
                            },
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: ProductCard(
                        product: product.basketProducts[index], setBasket: (ProductModel ) {  }, showAddToCartButton: false,
                      
                      ),
                    );
                  },
                ),
              ],
            ),

        floatingActionButton: Stack(
        children: [
          FloatingActionButton(
             onPressed: null,
            child: Icon(Icons.shopping_cart),
          ),
          if (totalCartItems > 0) // Conditionally show badge if totalCartItems > 0
            Positioned(
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 10,
                child: Text(
                  totalCartItems.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    
    );
  }
}
