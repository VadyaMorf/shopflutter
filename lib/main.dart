import 'package:flutter/material.dart';
import 'package:shop/widgets/auth/auth_widget.dart';
import 'package:shop/widgets/basket/basket_page.dart';
import 'package:shop/widgets/catalog/catalog_screen.dart';
import 'package:shop/widgets/create_screen/create_page.dart';
import 'package:shop/widgets/main_page.dart';
import 'package:shop/widgets/profile/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => AuthWidget(),
        '/main_page': (context) => MainPage(),
        '/catalog':(context) =>CatalogWidget(),
        '/basket':(context) => BasketPage(),
        '/profile':(context) => ProfilePage(),
        '/create':(context) => CreatePage(),
      },
      initialRoute: '/',
    );
  }
}
