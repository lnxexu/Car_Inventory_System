import 'package:corpuz_dart/models/car.dart';
import 'package:riverpod/riverpod.dart';

class CarService {
  final Ref container;
  final List<Car> _stock = [];
  CarService(this.container);

  List<Car> get stock => _stock;

  void addCar(String name, String brand, double price) {
    _stock.add(Car(name: name, brand: brand, price: price));
  }

  void removeCar(int index) {
    if (index >= 0 && index < _stock.length) {
      Car carRemoved = _stock.removeAt(index);
      print('$carRemoved removed.');
    } else {
      print('Invalid index. Please try again.');
    }
  }

  void listAvailableCars() {
    if (_stock.isEmpty) {
      print('No available cars.');
    } else {
      print('Products:');
      for (var stock in _stock) {
        print(stock);
      }
    }
  }
}
