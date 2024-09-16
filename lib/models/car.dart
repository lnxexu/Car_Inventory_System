class Car {
  final String name;
  final String brand;
  final double price;
  Car({
    required this.name,
    required this.brand,
    required this.price,
  });

  @override
  String toString() {
    return '$brand $name - \$${price.toStringAsFixed(2)}';
  }
}
