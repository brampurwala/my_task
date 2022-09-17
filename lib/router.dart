
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_practical_task/screens/dashboard.dart';
import 'package:my_practical_task/screens/home.dart';
import 'package:my_practical_task/screens/login.dart';
import 'package:my_practical_task/screens/register.dart';
import 'package:my_practical_task/screens/user_details.dart';

class AppRouter {
  static List<GetPage> pages = [
    GetPage(name: '/login', page: () => Login()),
    GetPage(name: '/home', page: () => Home()),
    GetPage(name: '/register', page: () => Register()),
    GetPage(name: '/user-details', page: () => UserDetails()),
    GetPage(name: '/dashboard', page: () => DashBoard()),

  ];
}