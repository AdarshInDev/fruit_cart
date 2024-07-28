// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:home_mart/Models/cart_model.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    int items = Provider.of<CartModel>(context).noOfItems();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          const Text(
            'Remove All',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          //button to delte all items in the cart starting
          IconButton(
              onPressed: (items == 0)
                  ? () {}
                  : () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor:
                              const Color.fromARGB(255, 182, 213, 203),
                          title: const Center(child: Text('Confirm')),
                          content: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Are you sure you want to delete all items from Cart',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16))),
                            TextButton(
                                onPressed: () {
                                  Provider.of<CartModel>(context, listen: false)
                                      .deleteAll();
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 16),
                                ))
                          ],
                        ),
                      );
                    },
              icon: const Icon(
                Icons.delete,
                size: 35,
              ))

              //button deleting all items from the cart ending
        ],
      ),

      //appbar ends body starts
      
      body: Consumer<CartModel>(builder: (context, value, child) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: value.addedcartItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        style: ListTileStyle.drawer,
                        tileColor: Colors.green,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            side: BorderSide(width: 1)),
                        title: Text(value.addedcartItems[index][0]),
                        subtitle: Text('\$' + value.addedcartItems[index][1]),
                        leading: Image.network(value.addedcartItems[index][2]),
                        trailing: IconButton(
                          icon: const Icon(Icons.cancel),
                          onPressed: () {
                            Provider.of<CartModel>(context, listen: false)
                                .removeItemAt(index);
                          },
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
              child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 134, 11, 132),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        const Text(
                          'Total Amount : ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          width: 130,
                        ),
                        Text(
                          '\$' +
                              Provider.of<CartModel>(context, listen: true)
                                  .calculateTotal(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        )
                      ],
                    ),
                  )),
            )
          ],
        );
      }),
    );
  }
}
