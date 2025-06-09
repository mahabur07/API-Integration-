import 'dart:convert';

import 'package:api_integration/home_service.dart';
import 'package:api_integration/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  List<ProductModel> products = [];
  List<String> Categories = [];
  List<ProductModel> productByCategories = [];

  bool isLoading = false;
  bool LoadingCategories = false;
  bool isProductsByCategories = false;
  bool isPostProducts = false;
  bool isProductsUpdate=false;
  bool isProductsDelete=false;

  late HomeService homeService;

  @override
  void onInit() {
    homeService = HomeService();
    getCategories();
    getProducts();
    // TODO: implement onInit
    super.onInit();
  }

  void getProducts() async {
    isLoading = true;
    update();

    try {
      http.Response response = await homeService.getProducts();
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        for (int i = 0; i < data.length; i++) {
          products.add(ProductModel.fromJson(data[i]));
          print(products);
        }
        isLoading = false;
        update();
      }
    } catch (e) {
      print(e);
    }
  }

  void getProductsByCategory(String Category) async {
    try {
      isProductsByCategories = true;
      update();

      http.Response response = await homeService.getProductsByCategories(
        Category,
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        for (int i = 0; i < data.length; i++) {
          productByCategories.add(ProductModel.fromJson(data[i]));
        }
        print(productByCategories);
      }
      isProductsByCategories = false;
      update();
    } catch (e) {
      print(e);
    }
  }

  void getCategories() async {
    LoadingCategories = true;
    update();

    try {
      http.Response response = await homeService.getCategories();
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        for (int i = 0; i < data.length; i++) {
          Categories.add(data[i]);
          LoadingCategories = false;
          update();
        }
      } else {
        print("Something Wrong");
      }
    } catch (e) {
      print(e);
    }
  }

  void postProducts(Map<String, dynamic> products) async {
    try {
      isPostProducts = true;
      update();
      http.Response response = await homeService.postProducts(products);
      if (response.statusCode == 200) {
        print(response.body);
        isPostProducts = false;
        update();
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  void UpdateProducts(Map<String, dynamic> products,String Id) async {
    try {
      isProductsUpdate = true;
      update();
      http.Response response = await homeService.postProducts(products);
      if (response.statusCode == 200) {
        print(response.body);
        isProductsUpdate = false;
        update();
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  void DeleteProducts(String Id) async {
    try {
      isProductsDelete = true;
      update();
      http.Response response = await homeService.DeleteProducts(Id);
      if (response.statusCode == 200) {
        print(response.body);
        isProductsDelete = false;
        update();
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

}
