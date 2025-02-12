import 'package:depot_boisson/widgets/products_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final List<Map<String, dynamic>> _boissons = [
    {
      'name': 'Coca Cola',
      'price': 500,
      'image': 'assets/images/coca_cola.jpg'
    },
    {
      'name': 'Pepsi',
      'price': 800,
      'image': 'assets/images/pepsi.jpg'
    },
    {
      'name': 'Fanta',
      'price': 400,
      'image': 'assets/images/fanta.jpg'
    },
    {
      'name': 'Sprite',
      'price': 450,
      'image': 'assets/images/sprite.jpg'
    },
    {
      'name': 'djama',
      'price': 500,
      'image': 'assets/images/djama.jpg'
    },
  ];
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: SafeArea(
        child:SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Bienvenue sur la page d'acceuil ", style: TextStyle(fontSize: 20,color: Colors.grey,letterSpacing: 0.5),),
                    Icon(Icons.shopping_cart)
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Card( 
                child: Container(
                  decoration: BoxDecoration(
                    gradient:  LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 68, 37, 6), const Color.fromARGB(255, 146, 58, 20)
                    ]
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      spreadRadius: 2
                    )
                  ]
                  ),
                  height: 100,
                  child: Row(
                    children: [      
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "De nouvelles boissons, aussi savoureuse les unes des autres, sont disponibles ici",
                              style: TextStyle(fontSize: 12,letterSpacing: 0.5,color: Colors.white ),
                            ),
                          ),
                        ),
                      ), 
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/images/fruit.jpg",
                            width: 100,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Column(
        children: [
          const Text("Boissons", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget._boissons.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Card(
                    
                    color: Colors.white,
                    child: Container(

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            spreadRadius: 2
                          )
                        ]
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            
                          },
                          child: ListTile(
                            title: Text(widget._boissons[index]['name']),
                            subtitle: Text("Prix: ${widget._boissons[index]['price']} francs cfa"),
                            leading: Container(
                              child: Image.asset(
                                widget._boissons[index]['image'],
                                width: MediaQuery.of(context).size.width * 0.2, 
                                height: MediaQuery.of(context).size.height * 0.2, 
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ),
                    ),
                  ),
                );
            },
          ),
        ],
      ),
            ],
          ),
        ),
      ),
    );
  }
}