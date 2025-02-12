import 'package:depot_boisson/models/my_product.dart';
import 'package:depot_boisson/widgets/ex.dart';
import 'package:depot_boisson/widgets/product_card_vertical.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeader(
              child: Container(
                child: Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: 60.0),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Catégories ',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(
                        height: 200.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: boissons.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 100.0,
                              width: 160.0,
                              margin: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    boissons[index]['icon'],
                                    height: 80.0,
                                    width: 80.0,
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    boissons[index]['name'],
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                children: [
                  Text(
                    'Nos Produits',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 12.0,
                        childAspectRatio: (100 / 140),
                      ),
                      itemCount: MyProduct.allProducts.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ProductCardVertical(
                              product: MyProduct.allProducts[index]),
                        );
                      },
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

  List<Map<String, dynamic>> boissons = [
    {'name': 'caffé', 'icon': 'assets/icons/coffee.png'},
    {'name': 'Jus de Fruits', 'icon': 'assets/icons/cocktail.png'},
    {'name': 'vin', 'icon': 'assets/icons/vin.png'},
    {'name': 'champagne', 'icon': 'assets/icons/champagne.png'},
    {'name': 'milshake', 'icon': 'assets/icons/milkshake.png'},
  ];
}
