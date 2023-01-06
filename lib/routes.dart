import 'package:get/route_manager.dart';
import 'package:hedfon_app/screens/addproduct.screen.dart';

import 'screens/detail.screen.dart';
import 'screens/home.screen.dart';

class Routes {
  static String initialPage = '/home';
  static List<GetPage> routes = [
    GetPage(name: '/home', page: () => HomeScreen()),
    GetPage(name: '/detail', page: () => DetailScreen()),
    GetPage(name: '/addpro', page: () => AddProductScreen()),
  ];
}
