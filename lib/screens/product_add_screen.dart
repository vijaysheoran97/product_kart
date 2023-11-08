// import 'package:flutter/material.dart';
// import 'package:product_kart/product_api/product_api.dart';
// import 'package:product_kart/product_model/product_model_class.dart';
//
//
// class ProductAddScreen extends StatefulWidget {
//   const ProductAddScreen({super.key});
//
//   @override
//   State<ProductAddScreen> createState() => _ProductAddScreenState();
// }
//
// class _ProductAddScreenState extends State<ProductAddScreen> {
//   TextEditingController addImage = TextEditingController();
//   TextEditingController addName = TextEditingController();
//   TextEditingController addPrice = TextEditingController();
//   TextEditingController addDescription = TextEditingController();
//   TextEditingController addRating = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Column(children: [
//           const  Center(
//             child: Text(
//               'Add Product',
//               style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: TextFormField(
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8)),
//                   label:const Text(
//                     'Image URL',
//                     style: TextStyle(color: Colors.green),
//                   )),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: TextFormField(
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8)),
//                   label:const Text(
//                     'Image Name',
//                     style: TextStyle(color: Colors.green),
//                   )),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: TextFormField(
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8)),
//                   label:const Text(
//                     'Price',
//                     style: TextStyle(color: Colors.green),
//                   )),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: TextFormField(
//               maxLines: 5,
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8)),
//                   label:const Text(
//                     'Description',
//                     style: TextStyle(color: Colors.green),
//                   )),
//             ),
//           ),
//          const SizedBox(height: 12),
//           ElevatedButton(
//               onPressed: () async {
//                 ProductsResponse productsResponse = ProductsResponse(
//                   name: addName.text,
//                   imgUrl: addImage.text,
//                   price: int.parse(addPrice.text),
//                   description: addDescription.text,
//                 );
//                 try {
//                   ProductService productService = ProductService();
//                   await productService.addProduct(productsResponse);
//                 } catch (e) {
//                   print('Error: $e');
//                 }
//               },
//               child:const Text('Add Product'))
//         ]),
//       ),
//     );
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:product_kart/product_api/product_api.dart';
import 'package:product_kart/product_model/product_model_class.dart';


class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController imageController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController ratingController = TextEditingController();

  Future addProduct() async {
    ProductModel productModel = ProductModel(
        name: nameController.text,
        imgUrl: imageController.text,
        price: int.parse(priceController.text),
        description: descriptionController.text);
    try {
      ProductService productApi = ProductService();
      await productApi.addProduct(productModel);
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: imageController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Image URL',
                  labelStyle: TextStyle(color: Colors.green),
                ),
              ),
             const SizedBox(height: 16,),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.green),
                ),
              ),
              const SizedBox(height: 16,),
              TextFormField(
                controller: priceController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Price',
                  labelStyle: TextStyle(color: Colors.green),
                ),
              ),
              const SizedBox(height: 16,),
              TextFormField(
                maxLines: 3,
                controller: descriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                  labelStyle: TextStyle(color: Colors.green),
                ),
              ),
              const  SizedBox(height: 16,),
              ElevatedButton(
                onPressed: () async {
                  addProduct();
                  Navigator.pop(context);
                },
                child: const Text('Add Product'),
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}