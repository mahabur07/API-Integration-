import 'package:api_integration/Product_shimmer.dart';
import 'package:api_integration/action_page.dart';
import 'package:api_integration/add_product_page.dart';
import 'package:api_integration/categories_shimmer.dart';
import 'package:api_integration/delete_product_page.dart';
import 'package:api_integration/update_product_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

void main() {
  runApp(FastApp());
}

class FastApp extends StatelessWidget {
  FastApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
