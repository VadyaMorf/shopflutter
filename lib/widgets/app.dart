
import 'package:flutter/material.dart';
import 'package:shop/widgets/auth/auth_widget.dart';
//import 'package:shop/widgets/main_page.dart';

class App extends StatelessWidget{
  const App({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(  
      home: AuthWidget()//MainPage()
    );
  }
}

