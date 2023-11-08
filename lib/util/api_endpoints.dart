class ApiEndpoints {

 static  String baseUrl = 'http://192.168.1.83:3000/';
 static  String product = '${baseUrl}products';

 static String getProductUrl(String id){
  return '${baseUrl}products/$id';
 }

 static String updateProductUrl(int id){
  return '${baseUrl}products/$id';
 }

 static  String addProduct = 'http://192.168.1.83:3000/';
 static String productAdd = '${addProduct}addProduct';

 static String addProductUrl(){
  return '${addProduct}addProduct';
 }
}