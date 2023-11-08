// import 'package:flutter/material.dart';
// import '../product_model/product_model_class.dart';
//
// class ProductKartScreen extends StatefulWidget {
//  final ProductsResponse productModel;
//
//  const ProductKartScreen({super.key, required this.productModel});
//
//   @override
//   State<ProductKartScreen> createState() => _ProductKartScreenState();
// }
//
// class _ProductKartScreenState extends State<ProductKartScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Product Details"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Image.network(
//               widget.productModel.imgUrl.toString(),
//               height: 200,
//               width: 200,
//             ),
//             ListTile(
//               title: Text(widget.productModel.name.toString()),
//               subtitle: Text('\u0024${widget.productModel.price.toString()}'),
//               trailing: Text(widget.productModel.rating!.toString()),
//             ),
//             Text(widget.productModel.description.toString()),
//             const SizedBox(height: 34),
//
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//
//           onPressed: (){},child: Text("Buy")),
//     );
//   }
// }
