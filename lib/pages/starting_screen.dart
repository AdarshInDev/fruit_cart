import 'package:flutter/material.dart';
import 'package:home_mart/pages/shopping_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Hello There,",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    )),
              ),
              Image.network(
                'https://static.vecteezy.com/system/resources/thumbnails/002/147/179/small/guava-and-guava-slices-free-vector.jpg',
                height: 400,
                width: 400,
                scale: 0.5,
              ),
              const Text(
                'Get Your Fresh\n   Fruits Now!',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('For Your Daily Needs'),
              const SizedBox(
                height: 35,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Shopping()),
                  );
                },
                child: Material(
                  elevation: 20,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: const Center(
                        child: Text(
                      "Get Started",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
