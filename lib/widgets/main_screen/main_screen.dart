import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/widgets/catalog_screens/glukometr_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainScreen> {
  FocusNode _focusNode = FocusNode();
  List<Map<String, String>> items = [
    {
      'image': 'assets/images/tonometr.png', 
      'name': 'Тонометры',
    },
    {
      'name': 'Корсеты',
      'image': 'assets/images/corset.png', 
    },
    {
      'name': 'Стельки',
      'image': 'assets/images/stelki.png', 
    },
    {
      'name': 'Глюкометры',
      'image': 'assets/images/glukometr.png', 
    },
    {
      'name': 'Ирегаторы',
      'image': 'assets/images/iregator.png', 
    },
    {
      'name': 'Ингаляторы',
      'image': 'assets/images/ingalator.png', 
    },
  ];
  static const List<Widget> _widgetOptions = <Widget>[
    MainScreen(),
    Categories(items: [],),
    Text('a')
  ];
  var _selectedIndexPage = 0;
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _openPage(int index){
    setState(() => _selectedIndexPage = index);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        toolbarHeight: 140,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.border_all),
                SizedBox(width: 8),
                Text(
                  'Medtehnika - path to health',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                focusNode: _focusNode, 
                decoration: InputDecoration(
                  labelText: 'Поиск',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: _focusNode.hasFocus
                      ? null
                      : Icon(Icons.search, color: Colors.black),
                      suffixIcon: Icon(Icons.qr_code),
                  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainContainer(),
            Categories(items: items),
          ],
        ),
      ),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  final List<Map<String, String>> items;
  const Categories({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Актуальные категории',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 150, 
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(items.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color.fromRGBO(169, 169, 169, 0.5)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Image(image: AssetImage('assets/images/corset.png')),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Ходунки',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 150, 
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(items.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: GestureDetector(
                        onTap: (){
                          Widget page;
                          switch(index){
                            case 0:
                              page = GlukometrScreen();
                              break;
                            case 1:
                              page = GlukometrScreen();
                              break;
                            case 2:
                              page = GlukometrScreen();
                              break;
                            case 3:
                              page = GlukometrScreen();
                              break;
                            case 4:
                              page = GlukometrScreen();
                              break;
                            case 5:
                              page = GlukometrScreen();
                              break;
                            default:
                              page = GlukometrScreen();
                          }

                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context)=>page,
                            ),
                          );
                        },
                        child: Container(
                          width: 120,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color.fromRGBO(169, 169, 169, 0.5)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                items[index]['image']!,
                                width: 120,
                                height: 120,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                items[index]['name']!,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        )
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Ингаляторы',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 150, 
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(5, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Icon(Icons.title, weight: 75),
                            const SizedBox(height: 8),
                            const SizedBox(height: 70,),
                            Text(
                              'Категория ${index + 1}',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Тонометры',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 150, 
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(5, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Icon(Icons.title, weight: 75),
                            const SizedBox(height: 8),
                            const SizedBox(height: 70,),
                            Text(
                              'Категория ${index + 1}',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class MainContainer extends StatelessWidget{
  const MainContainer({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Container(
          padding: EdgeInsets.all(8),
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(169, 169, 169, 0.5)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15), 
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Icon(Icons.discount_sharp, size: 35,),
                        Text('Дисконт', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(child: 
                    Column(
                      children: [
                        Icon(Icons.store_mall_directory, size: 35,),
                        Text('Каталог', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(child: 
                    Column(
                      children: [
                        Icon(Icons.more_horiz, size: 35,),
                        Text('Больше', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }
}
