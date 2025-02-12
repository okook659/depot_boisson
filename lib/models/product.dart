class Product {
  final int id;
  final String name;
  final String category;
  final String description;
  final double price;
  final String image;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.image,
    this.quantity = 1,
  });
  
    
}