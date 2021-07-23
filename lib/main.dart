import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'routes.dart';
import './widgets/constant/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: ThemeUi.primaryDarkColor));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SeeDEKAH',
      theme: ThemeData(
        primaryColor: ThemeUi.primaryColor,
        scaffoldBackgroundColor: ThemeUi.backgroudColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeUi.textTheme,
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          textTheme: ThemeUi.textTheme.apply(bodyColor: Colors.white),
          centerTitle: true,
          elevation: 0,
        ),
      ),
      initialRoute: '/home',
      getPages: Routes.route,
    );
  }
}
