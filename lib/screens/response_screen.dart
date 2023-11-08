import 'package:product_kart/product_model/product_model_class.dart';


class ProductResponse {
  List<ProductModel> products = [];
  ProductResponse({required this.products});

  factory ProductResponse.fromJson(List<dynamic> json) {
    List<ProductModel> productList = [];
    for (var productJson in json) {
      productList.add(ProductModel.fromJson(productJson));
    }
    return ProductResponse(products: productList);
  }
}