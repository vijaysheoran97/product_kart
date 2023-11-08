// import 'package:flutter/material.dart';
// import 'package:product_kart/product_api/product_api.dart';
// import 'package:product_kart/product_model/product_model_class.dart';
//
//
//
// class UpdateScreen extends StatefulWidget {
//   const UpdateScreen({super.key, required this.productsResponse});
//   final ProductsResponse productsResponse;
//
//   @override
//   State<UpdateScreen> createState() => _UpdateScreenState();
// }
//
// class _UpdateScreenState extends State<UpdateScreen> {
//
//   TextEditingController updateImage = TextEditingController();
//   TextEditingController updateName = TextEditingController();
//   TextEditingController updatePrice = TextEditingController();
//   TextEditingController updateDescription = TextEditingController();
//
//   @override
//   void initState() {
//   ProductsResponse productsResponse = widget.productsResponse;
//   updateImage.text = productsResponse.imgUrl ?? '';
//   updateName.text = productsResponse.name?? '';
//   updatePrice.text = productsResponse.price?.toString()?? '';
//   updateDescription.text = productsResponse.description?? '';
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Column(children: [
//           const  Center(
//             child: Text(
//               'Update Screen',
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
//           const SizedBox(height: 12),
//           ElevatedButton(
//               onPressed: () async {
//                 ProductsResponse productsResponse = ProductsResponse(
//                   sId: widget.productsResponse.sId,
//                   name: updateName.text,
//                   imgUrl: updateImage.text,
//                   price: int.parse(updatePrice.text),
//                   description: updateDescription.text,
//                 );
//                 try {
//                   ProductService productService = ProductService();
//                   await productService.updateProducts(productsResponse);
//                 } catch (e) {
//                   print('Error: $e');
//                 }
//               },
//               child:const Text('Update Product'))
//         ]),
//       ),
//     );
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:product_kart/product_api/product_api.dart';
import 'package:product_kart/product_model/product_model_class.dart';


class UpdateProduct extends StatefulWidget {
  final ProductModel productModel;

  const UpdateProduct({super.key, required this.productModel});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  TextEditingController imageController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    ProductModel product = widget.productModel;
    imageController.text = product.imgUrl ?? '';
    nameController.text = product.name ?? '';
    priceController.text = product.price?.toString() ?? '';
    descriptionController.text = product.description ?? '';
    super.initState();
  }

  Future update() async {
    ProductModel productModel = ProductModel(
        sId: widget.productModel.sId,
        name: nameController.text,
        imgUrl: imageController.text,
        price: int.parse(priceController.text),
        description: descriptionController.text);
    try {
      ProductService productService = ProductService();
      await productService.updateProduct(productModel);
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
        title: const Text('Update Product'),
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
              const SizedBox(height: 16,),
              ElevatedButton(
                onPressed: () async {
                  update();
                  Navigator.pop(context);
                },
                child: const Text('Update Product'),
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}