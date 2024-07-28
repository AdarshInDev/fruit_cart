// ignore_for_file: must_be_immutable, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String itemUrl;
  final Color clr;
  void Function()? onPressed;
  ItemCard({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.itemUrl,
    required this.clr,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 120,
        width: 60,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.black, blurRadius: 10.0, offset: Offset(2, 5))
            ],
            color: clr,
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Column(
          children: [
            //Item image
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(
                        itemUrl,
                      ),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //Item name
            Text(
              itemName,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),

            //temp price + button
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15),
              child: MaterialButton(
                splashColor: const Color.fromARGB(255, 12, 83, 140),
                color: Colors.blue,

                onPressed: onPressed,
                
                child: Row(children: [
                  const Icon(Icons.shopping_cart),
                  const SizedBox(
                    width: 50,
                  ),
                  Text('\$' + itemPrice),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
