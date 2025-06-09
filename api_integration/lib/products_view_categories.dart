import 'package:api_integration/Product_shimmer.dart';
import 'package:api_integration/home_controller.dart';
import 'package:api_integration/product_model.dart';
import 'package:api_integration/products_detailce_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsViewCategories extends StatelessWidget {
  String category="";
 ProductsViewCategories(this.category);

 HomeController homeController=Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Container(
        child: GetBuilder<HomeController>(builder: (_){
          return homeController.isProductsByCategories?ProductShimmer(): GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10
            ),
            shrinkWrap: true,
            itemCount: homeController.productByCategories.length,
            itemBuilder: (context, index) {
              ProductModel product = homeController.productByCategories[index];
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
                                children: [Text("Price : ",style: TextStyle(fontWeight: FontWeight.bold),),
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
          );
        }),
      ),
    );
  }
}
