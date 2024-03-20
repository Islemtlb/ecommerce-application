
import 'package:ecom/view/home/base_scaffold.dart';
import 'package:ecom/view/products/products_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: BaseScaffold(),
      ),
    );;
  }
}