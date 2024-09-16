import 'dart:io';
import 'package:riverpod/riverpod.dart';
import 'package:corpuz_dart/globalProvider.dart';

void main() {
  final container = ProviderContainer();
  final carService = container.read(carServiceProvider);

  while (true) {
    print('1. Add Car');
    print('2. Remove Car');
    print('3. List Available Cars');
    print('4. Exit');
    print('Choose an option:');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('Enter car name:');
        String? name = stdin.readLineSync();
        print('Enter car brand:');
        String? brand = stdin.readLineSync();
        print('Enter car price:');
        String? priceInput = stdin.readLineSync();
        double price = double.tryParse(priceInput ?? '') ?? 0.0;

        if (name != null && brand != null && price > 0) {
          carService.addCar(name, brand, price);
          print('Car added: $brand $name for \$${price.toStringAsFixed(2)}');
        } else {
          print('Invalid input. Please try again.');
        }
        break;
      case '2':
        print('Enter the index of the car to remove:');
        String? indexInput = stdin.readLineSync();
        int index = int.tryParse(indexInput ?? '') ?? 0;
        carService.removeCar(index);
        break;
      case '3':
        carService.listAvailableCars();
        break;
      case '4':
        print('Exiting...');
        container.dispose();
        return;
      default:
        print('Invalid option. Please try again.');
    }
  }
}
