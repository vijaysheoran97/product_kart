// import 'package:flutter/material.dart';
// import 'package:product_kart/product_api/product_api.dart';
// import 'package:product_kart/product_model/product_model_class.dart';
// import 'package:product_kart/screens/product_add_screen.dart';
// import 'package:product_kart/screens/product_kart_screen.dart';
// import 'package:product_kart/screens/update_screen.dart';
//
// class ProductScreen extends StatefulWidget {
//   const ProductScreen({super.key});
//
//   @override
//   State<ProductScreen> createState() => _ProductScreenState();
// }
//
// class _ProductScreenState extends State<ProductScreen> {
//   late ProductService productService;
//   List<ProductsResponse> productList = [];
//
//   getProducts() async {
//     productList = await ProductService.getAllProducts();
//     setState(() {});
//   }
//
//   @override
//   void initState() {
//     getProducts();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ProductKart'),
//       ),
//       body: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           mainAxisExtent: Checkbox.width*16,
//             crossAxisCount: 2, mainAxisSpacing: 4, crossAxisSpacing: 4),
//         itemCount: productList.length,
//         itemBuilder: (context, index) {
//           ProductsResponse productResponse = productList[index];
//           return GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) {
//                     return ProductKartScreen(
//                       productModel: productResponse,
//                     );
//                   },
//                 ),
//               );
//             },
//             child: Card(
//               surfaceTintColor: Colors.white,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                      Row(children: [
//
//                     IconButton(onPressed: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (context){
//                         return UpdateScreen(productsResponse: productResponse,);
//                       }));
//                     }, icon: const Icon(Icons.edit)),
//                       Spacer(),
//                       Icon(Icons.delete),
//                     ],),
//                     Image.network(
//                       productResponse.imgUrl.toString(),
//                       height:MediaQuery.of(context).size.height * 0.15,
//                       width: MediaQuery.of(context).size.width * 0.15,
//                     ),
//                     ListTile(title:Text(productResponse.name.toString(), maxLines: 1),
//                     subtitle:  Text('\u0024${productResponse.price.toString()}'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(onPressed: (){
//         Navigator.push(context, MaterialPageRoute(builder: (context) {
//           return const ProductAddScreen();
//         },));
//         getProducts();
//       },child:const Icon(Icons.add),),
//     );
//
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:product_kart/product_api/product_api.dart';
import 'package:product_kart/product_model/product_model_class.dart';
import 'package:product_kart/screens/deatail_screen.dart';
import 'package:product_kart/screens/product_add_screen.dart';
import 'package:product_kart/screens/update_screen.dart';


class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late ProductService productService;
  List<ProductModel> productList = [];
  String? error;


  Future getProducts() async {
    try {
      setState(() {});

      productService = ProductService();
      productList = await productService.getProduct();
    } catch (e) {
      error = e.toString();
      if (kDebugMode) {
        print(error);
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    productService = ProductService();
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductKart'),
        actions: [
          IconButton(onPressed: ()async{
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const AddProductScreen();
                },
              ),
            );
            getProducts();
          },
              icon: const Icon(Icons.add)),
        ],
      ),
      body:ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            ProductModel productModel = productList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProductDetailScreen(
                        productModel: productModel,
                      );
                    },
                  ),
                );
              },
              child: Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return UpdateProduct(
                                    productModel: productModel,
                                  );
                                },
                              ),
                            );
                            getProducts();
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () async {
                              setState(() {
                              });
                              try {
                                await productService
                                    .deleteProduct(productModel.sId.toString());
                                await getProducts();
                              } catch (e) {
                                if (kDebugMode) {
                                  print(e);
                                }
                              } finally {
                                setState(() {
                                });
                              }
                            },
                            icon: const Icon(Icons.delete),
                        )
                      ],
                    ),
                    Image.network(
                      productModel.imgUrl.toString(),
                      fit: BoxFit.fill,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.15,
                    ),
                    ListTile(
                      title: Text('Name : ${productModel.name}'),
                      subtitle: Text("Price : ${productModel.price.toString()}"),
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}