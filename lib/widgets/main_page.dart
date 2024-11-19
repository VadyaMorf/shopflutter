import 'package:flutter/material.dart';
import 'package:shop/widgets/basket/basket_page.dart';
import 'package:shop/widgets/catalog/catalog_screen.dart';
import 'package:shop/widgets/create_screen/create_page.dart';
import 'package:shop/widgets/main_screen/main_screen.dart';
import 'package:shop/widgets/profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static List<Widget> _widgetOptions = <Widget>[
    MainScreen(),
    CatalogWidget(),
    BasketPage(),
    CreatePage(),
    ProfilePage()
  ];
  var _selectedIndexPage = 0;

  void _openPage(int index){
    setState(() => _selectedIndexPage = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        toolbarHeight: 0,
      ),
      body: Center(
        child: _widgetOptions[_selectedIndexPage],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        currentIndex: _selectedIndexPage,
        onTap: _openPage,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Главная'),
        BottomNavigationBarItem(icon: Icon(Icons.settings_input_component_sharp),label: 'Каталог'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_basket),label: 'Корзина'),
        BottomNavigationBarItem(icon: Icon(Icons.description),label: 'Список'),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: 'Профиль'),
      ]
      ),
    );
  }
}