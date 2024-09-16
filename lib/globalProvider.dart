import 'package:corpuz_dart/service/carService.dart';
import 'package:riverpod/riverpod.dart';

final carServiceProvider = StateProvider((ref) => CarService(ref));
