import 'package:get/get.dart';
import './pages/home_page.dart';
import './pages/topup_page.dart';
import './pages/location_page.dart';

class Routes {
  static final route = [
    GetPage(name: '/home', page: () => HomePage()),
    GetPage(
      name: '/topup',
      page: () => TopUpPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/location',
      page: () => LocationPage(),
      transition: Transition.rightToLeft,
    ),
  ];
}
