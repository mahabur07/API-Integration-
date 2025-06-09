import 'package:api_integration/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsDetailcePage extends StatelessWidget {
  ProductModel product;
 ProductsDetailcePage(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Detailce Page",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: [
            Image.network(product.image!,width: Get.width,height: 220,fit: BoxFit.cover,),
            SizedBox(height: 15.0,),
            Row(
              children: [
                Expanded(
                    flex: 3,
                    child:
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(product.title!,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                )),
                SizedBox(width: 10,),
                Expanded(
                    flex: 1,
                    child:
                Text('Price : '+product.price.toString(),style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),)),
              ],
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(product.description!,style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }
}
