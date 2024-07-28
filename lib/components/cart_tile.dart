// // ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// import 'package:flutter/material.dart';
// import 'package:home_mart/Models/cart_model.dart';
// import 'package:provider/provider.dart';


// class CartTile extends StatelessWidget {
//   String name;
//   String price;
//   String image;
//   CartTile({
//     super.key,
//     required this.name,
//     required this.price,
//     required this.image,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<CartModel>(builder: (context, value, child) {
//       return ListTile(
//         tileColor: Colors.green,
//         leading: Image.network(image),
//         title: Text(value.addedcartItems[index][0]),
//         subtitle: Text('\$' + value.addedcartItems[index][1]),
//         shape: const BeveledRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10))),
//         trailing: IconButton(
//           onPressed: Provider.of<CartModel>(context, listen: false)
//               .removeItemAt(index),
//           icon: const Icon(Icons.remove_circle),
//         ),
//       );
//     });
//   }
// }
