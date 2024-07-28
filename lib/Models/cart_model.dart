import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _cartItems = [
    //[name, price,url,colors]
    [
      'Guava',
      '10',
      'https://img.freepik.com/premium-vector/orange-fruit-cartoon-vector-illustration_242622-272.jpg',
      Colors.green,
    ],
    [
      'Orange',
      '10',
      'https://img.freepik.com/premium-vector/orange-fruit-cartoon-vector-illustration_242622-272.jpg',
      Colors.orange,
    ],
    [
      'Banana',
      '10',
      'https://img.freepik.com/premium-vector/orange-fruit-cartoon-vector-illustration_242622-272.jpg',
      Colors.yellow,
    ],
    [
      'Litchi',
      '10',
      'https://img.freepik.com/premium-vector/orange-fruit-cartoon-vector-illustration_242622-272.jpg',
      Colors.pink,
    ],
    [
      'Apple',
      '10',
      'https://cdn.pixabay.com/photo/2016/11/18/13/47/apple-1834639_1280.jpg',
      Colors.red,
    ],
    [
      'Pear',
      '10',
      'https://as2.ftcdn.net/v2/jpg/01/39/74/33/1000_F_139743396_fw67GJkSpb1QthswSiqPvhX2AwycWR52.jpg',
      Colors.orange,
    ],
    [
      'Grapes',
      '10',
      'https://t3.ftcdn.net/jpg/05/94/12/90/360_F_594129085_JMsrpxg7rxjcSnRbfbMRFa3MHkvjOGb9.jpg',
      Colors.purple,
    ],
    [
      'Strawberry',
      '10',
      'https://thumbs.dreamstime.com/z/red-strawberry-fruits-isolated-white-10024359.jpg',
      Colors.pink,
    ],
    [
      'Watermelon',
      '10',
      'https://as2.ftcdn.net/v2/jpg/01/39/74/35/1000_F_139743534_Sg2CP2r3T8D5jOXML7FsFFDbGPCS2suK.jpg',
      Colors.green,
    ],
  ];

  final List _addedcartItems = [];

  get cartItems => _cartItems;
  get addedcartItems => _addedcartItems;

//add item to cart
  void addItemToCart(int index) {
    _addedcartItems.add(_cartItems[index]);
    notifyListeners();
  }

//remove item from cart
  removeItemAt(int index) {
    _addedcartItems.removeAt(index);
    notifyListeners();
  }

  //no of items in cart
  int noOfItems() {
    return _addedcartItems.length;
  }

//calculate the total price
  String calculateTotal() {
    double total = 0;
    for (int i = 0; i < _addedcartItems.length; i++) {
      total += double.parse(_addedcartItems[i][1]);
    }
    return total.toStringAsFixed(2);
  }
  //delete all item from the cart
  void deleteAll() {
    _addedcartItems.clear();
    notifyListeners();
  }
}
