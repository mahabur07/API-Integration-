import 'package:api_integration/action_page.dart';
import 'package:api_integration/categories_shimmer.dart';
import 'package:api_integration/home_controller.dart';
import 'package:api_integration/product_model.dart';
import 'package:api_integration/products_detailce_page.dart';
import 'package:api_integration/products_view_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Product_shimmer.dart' show ProductShimmer;

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text(
          "Products",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
              onTap: (){
                Get.to(ActionPage()); 
              },
              child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 15.0,
                  child: Icon(Icons.add,color: Colors.white,)),
            ),
          )
        ],
      ),

      body: Column(
        children: [
          GetBuilder<HomeController>(builder: (_){
            return homeController.isLoading?CategoriesShimmer(): SizedBox(
              height: 35,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: homeController.Categories.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0,),
                      child: GestureDetector(
                        onTap: (){
                          homeController.getProductsByCategory(homeController.Categories[index]);
                          Get.to(ProductsViewCategories(homeController.Categories[index].toUpperCase()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Center(child: Text(homeController.Categories[index].toUpperCase(),style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold,color: Colors.white),)),
                        ),
                      ),
                    );
                  }),
            );
          }),
          SizedBox(height:  15,),

          GetBuilder<HomeController>(
            builder: (_) {
              return homeController.isLoading?Center(child: ProductShimmer()):
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10
                    ),
                  shrinkWrap: true,
                  itemCount: homeController.products.length,
                  itemBuilder: (context, index) {
                    ProductModel product = homeController.products[index];
                    return GestureDetector(
                      onTap: (){
                        Get.to(ProductsDetailcePage(product));
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.network(product.image!,
                              height: 70,
                                width: 70,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 10,),
                              Text(product.title!,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 18.0),),
                              SizedBox(height: 5.0,),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Text("Price : ",style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text(product.price.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                   SizedBox(width: 11,),
                                 Row(
                                    children: [
                                      Icon(Icons.star,color: Colors.orange,size: 18,),
                                      Icon(Icons.star,color: Colors.orange,size: 18,),
                                    //  Text(product.rating.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ),
                    );
                  },
                  ),
                );
            },
          ),
        ],
      ),
    );
  }
}
