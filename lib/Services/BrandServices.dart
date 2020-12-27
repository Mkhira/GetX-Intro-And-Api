import 'package:http/http.dart' as http;
import 'package:introgetx/Modles/BrandModel.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<BrandModel>> fetchProducts() async {
    var response = await client.get(
        'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline');
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return brandModelFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
