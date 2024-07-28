import 'package:flutter/material.dart';
import 'package:home_mart/Models/cart_model.dart';
import 'package:home_mart/components/itemcardwidget.dart';
import 'package:home_mart/pages/Cart_page.dart';
import 'package:provider/provider.dart';

class Shopping extends StatelessWidget {
  const Shopping({super.key});

  @override
  Widget build(BuildContext context) {
    int items = Provider.of<CartModel>(context, listen: true).noOfItems();
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //       icon: const Icon(Icons.arrow_back_ios)),
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    // color: Colors.blue,
                    // width: MediaQuery.of(context).size.width - 40,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello Good Morning ,',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Let\'s Order Fresh Fruits For You',
                          style: TextStyle(
                              fontSize: 43, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 0,
                ),
                const Divider(
                  height: 5,
                ),
                const SizedBox(
                  height: 0,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Fresh Fruits',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Consumer<CartModel>(
                    builder: (context, value, child) {
                      return GridView.builder(
                          itemCount: value.cartItems.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return ItemCard(
                                itemName: value.cartItems[index][0],
                                itemPrice: value.cartItems[index][1],
                                itemUrl: value.cartItems[index][2],
                                clr: value.cartItems[index][3],
                                onPressed: () {
                                  Provider.of<CartModel>(context, listen: false)
                                      .addItemToCart(index);
                                });
                          });
                    },
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 15,
              right: 15,
              child: Stack(
                children: [
                  FloatingActionButton(
                      backgroundColor: Colors.purple[200],
                      splashColor: Colors.purple[400],
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Cart()));
                      },
                      child: const Icon(
                        Icons.shopping_cart_checkout,
                        size: 35,
                      )),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      width: (items >= 100) ? 35 : 22,
                      height: 22,
                      child: Center(
                          child: (items > 100)
                              ? const Text('100+')
                              : Text(
                                  Provider.of<CartModel>(context, listen: true)
                                      .noOfItems()
                                      .toString(),
                                  style: const TextStyle(color: Colors.white),
                                )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
