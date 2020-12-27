

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introgetx/Controllers/IntroController.dart';

class IntroPage extends StatelessWidget {
  final controller = IntroController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Obx((){
            return Text("${controller.isLastPage ? "Done" : "Next"}");
          }),
          onPressed: (){
            controller.forWardView();
          },
        ),
        body: Stack(
          children: [
            PageView.builder(
              controller: controller.pageController,
              onPageChanged: controller.selectPageIndex,
                itemCount: controller.introModel.length,
                itemBuilder: (context,index){
                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(controller.introModel[index].image),
                        Text(controller.introModel[index].title),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Text(controller.introModel[index].description,textAlign: TextAlign.center,),
                        ),
                      ],
                    ),
                  );
                }),
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                children: List.generate(controller.introModel.length, (index) =>
                    Obx((){
                      return Container(
                        margin: EdgeInsets.all(6),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: controller.selectPageIndex.value == index ? Colors.blue : Colors.grey
                        ),
                      );
                    })
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
