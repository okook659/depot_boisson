import 'package:depot_boisson/models/product.dart';

class MyProduct {
  static List<Product> allProducts = [
    Product(
      id: 1,
      name: 'Fanta',
      category: 'Sucrerie',
      description: 'Boisson ',
      price: 500,
      image: 'assets/images/fanta.png',
    ),
    Product(
      id: 2,
      name: 'Jus d''orange',
      category: 'Jus de Fruits',
      description: 'Jus de Fruits',
      price: 600,
      image: 'assets/images/fruit.png'
    ),
    Product(
      id: 3,
      name: 'Coca-Cola',
      category: 'Sucrerie',
      description: 'Boisson',
      price: 400,
      image: 'assets/images/coca_cola.png',
    ),
    Product(
      id: 4,
      name: 'Sprite',
      category: 'Sucrerie',
      description: 'Boisson',
      price: 600,
      image: 'assets/images/sprite.png',
    ),
    Product(
      id: 5,
      name: 'Pepsi',
      category: 'Bierre',
      description: 'Boisson',
      price: 500,
      image: 'assets/images/pepsi.png',
    ),
    Product(
      id: 6,
      name: 'Djama',
      category: 'Bierre',
      description: 'Boisson',
      price: 500,
      image: 'assets/images/djama.png',
    ),
  ];
}