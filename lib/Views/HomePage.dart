import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:introgetx/Controllers/BrandController.dart';
import 'package:introgetx/Widget/BrandCard.dart';

class HomePage extends StatelessWidget {
  final brandController  = Get.put(BrandController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: AnimationLimiter(
        child: Obx((){
          if(brandController.isLoding.value ){
            return Center(child: CircularProgressIndicator(),);
          }else{

            return
              GridView.count(
                crossAxisSpacing: 1,
                childAspectRatio: 3/5,
                crossAxisCount: 2,
                children: List.generate(brandController.brandList.length, (index) =>
                    AnimationConfiguration.staggeredGrid(
                      position: index,
                      columnCount: 2,

                      delay: Duration(milliseconds: 200),
                      child: SlideAnimation(
                        duration: Duration(milliseconds: 500),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5,right: 5,bottom: 5,top: 5),
                          child: FadeInAnimation(

                              child: ProductTile(product: brandController.brandList[index],)
                          ),
                        ),
                      ),
                    ))

                ,
              );
          }
        }),
      ),
    ));
  }
}


