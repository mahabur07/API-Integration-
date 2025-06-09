import 'package:api_integration/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteProductPage extends StatelessWidget {
  DeleteProductPage({super.key});

  final TextEditingController productIdClt=TextEditingController();
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
                          hintText: "Id",contentPadding: EdgeInsets.only(left: 8.0)
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  child: InkWell(
                    onTap: (){
                      homeController.DeleteProducts(productIdClt.text);
                    },
                    child: Container(
                      width: Get.width,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue
                      ),
                      child: Center(
                        child: Text("Delete Products",style:
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
