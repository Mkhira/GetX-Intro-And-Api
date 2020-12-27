



import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:introgetx/Modles/IntroModel.dart';
import 'package:introgetx/Views/HomePage.dart';

class IntroController extends GetxController {
  var selectPageIndex = 0.obs;
  final pageController = PageController();
   bool get isLastPage => selectPageIndex.value == introModel.length-1;
  forWardView(){
    if( !isLastPage) {
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.bounceIn);
    }else{
      Get.to(HomePage());
    }
  }

  List<IntroModel> introModel =[
    IntroModel(image: "assets/cook.png",description: "welcome To our Food App" ,title: "Cook"),
    IntroModel(image: "assets/deliver.png",description: "we go to you where you are" ,title: "deliver"),
    IntroModel(image: "assets/order.png",description: "just start to make your order" ,title: "order"),
  ];




}