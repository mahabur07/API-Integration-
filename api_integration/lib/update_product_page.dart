import 'package:api_integration/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProductPage extends StatelessWidget {
  UpdateProductPage({super.key});

  final TextEditingController productClt=TextEditingController();
  final TextEditingController productIdClt=TextEditingController();
  final TextEditingController priceClt=TextEditingController();
  final TextEditingController descriptionClt=TextEditingController();

  HomeController homeController=Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child:Column(
              children: [

                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                  ),
                  child: Container(
                    child: TextField(
                      controller: productIdClt,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Products Id",contentPadding: EdgeInsets.only(left: 8.0)
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10.0,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                  ),
                  child: Container(
                    child: TextField(
                      controller: productClt,
                      decoration: InputDecoration(
                          hintText: "Products Name",contentPadding: EdgeInsets.only(left: 8.0)
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                  ),
                  child: Container(
                    child: TextField(
                      controller: priceClt,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Products price",contentPadding: EdgeInsets.only(left: 8.0)
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                  ),
                  child: Container(
                    child: TextField(
                      controller: descriptionClt,
                      decoration: InputDecoration(
                          hintText: "Products Description",contentPadding: EdgeInsets.only(left: 8.0)
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  child: InkWell(
                    onTap: (){
                      Map<String,dynamic>product={
                        "name":productClt.text,
                        "price":priceClt.text,
                        "description":descriptionClt.text,
                      };

                      homeController.UpdateProducts(product,productIdClt.text);
                    },
                    child: Container(
                      width: Get.width,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue
                      ),
                      child: Center(
                        child: Text("Update Products",style:
                        TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
        )
    );
  }
}
