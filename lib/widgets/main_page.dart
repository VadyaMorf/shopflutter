import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  FocusNode _focusNode = FocusNode();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        toolbarHeight: 120,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.shop, color: Colors.white),
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
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainContainer(),
            Categories(),
          ],
        ),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start, 
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
        padding: const EdgeInsets.all(16.0),
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
