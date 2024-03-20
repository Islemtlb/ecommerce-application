

import 'package:ecom/controller/product_riverpod.dart';
import 'package:ecom/model/product.dart';
import 'package:flutter_test/flutter_test.dart';



void main() {
  group('ProductRiverpod', () {
    late ProductRiverpod productRiverpod;

    setUp(() {
      productRiverpod = ProductRiverpod();
    });

    test('Adding product to basket', () {
      // Arrange
      final product = ProductModel(
        category: 'Test Category',
        name: 'Test Product',
        price: 10.0,
        description: 'Test Description',
        imagePath: 'test/image/path',
      );

      // Act
      productRiverpod.addedBasket(product);

      // Assert
      expect(productRiverpod.basketProducts.length, 1);
      expect(productRiverpod.basketProducts[0], product);
    });

    test('Deleting product from basket', () {
      // Arrange
      final product1 = ProductModel(
        category: 'Test Category 1',
        name: 'Test Product 1',
        price: 10.0,
        description: 'Test Description 1',
        imagePath: 'test/image/path/1',
      );
      final product2 = ProductModel(
        category: 'Test Category 2',
        name: 'Test Product 2',
        price: 20.0,
        description: 'Test Description 2',
        imagePath: 'test/image/path/2',
      );
      productRiverpod.addedBasket(product1);
      productRiverpod.addedBasket(product2);

      // Act
      productRiverpod.deleteBasket(product1);

      // Assert
      expect(productRiverpod.basketProducts.length, 1);
      expect(productRiverpod.basketProducts[0], product2);
    });
  });
}
