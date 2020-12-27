

import 'package:get/get.dart';
import 'package:introgetx/Modles/BrandModel.dart';
import 'package:introgetx/Services/BrandServices.dart';
class BrandController extends GetxController{

  var isLoding = true.obs;
  var brandList = List<BrandModel>().obs;
@override
 void onInit() {

  // TODO: implement onInit
  fetchProducts();
    super.onInit();
  }
 void fetchProducts() async{
    try{
      isLoding(true);
      var prouducts = await RemoteServices.fetchProducts();
      if(prouducts != null){
        brandList.value = prouducts;
      }
    }finally{
      isLoding(false);
    }
    isLoding(false);

 }
}