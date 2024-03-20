import 'package:ecom/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  


  ProductCard({
    required this.product,
  
    
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ClipRRect(borderRadius: BorderRadius.only(
    topLeft: Radius.circular(10.0),
    topRight: Radius.circular(10.0),
  ),

            child: Image.asset(
              product.imagePath,
              fit: BoxFit.cover,
              height: 200,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  product.category,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                   
                    Text(
                      product.price.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ), Text(
                      '\$',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     
                     Padding(
                       padding:  EdgeInsets.only(left:60
                       ),
                       child: ElevatedButton.icon(
                                         onPressed: () {
                                           
                                         },
                                         icon: Icon(Icons.add_shopping_cart),
                                         label: Text('Add to Cart'),
                                       ),
                     ),
                  ],
                ),
               // Add space for the button
               
              ],
            ),
          ),
        ],
      ),
    );
  }
}