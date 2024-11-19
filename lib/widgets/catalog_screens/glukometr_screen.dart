import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class GlukometrScreen extends StatefulWidget {
  const GlukometrScreen({Key? key}) : super(key: key);

  @override
  GlukometrScreenState createState() => GlukometrScreenState();
}
  class GlukometrScreenState extends State<GlukometrScreen>{
  final List<String> pickerItems = ['Популярные', 'Сначала дорогие', 'Сначала дешевые', 'А-я', 'Я-а'];
  List<Map<String, String>> responseItems = [];
  String? selectedvalue;
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

  @override
  void initState() {
    super.initState();
    fetchItems();
  }
  Future<void> fetchItems() async {
    final url = 'http://10.0.2.2:5132/Products';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);

        setState(() {
          responseItems = data.map((item) {
            return {
              'name': item['title']?.toString() ?? 'Нет названия',
              'description': item['description']?.toString() ?? 'Нет описания',
              'price': (item['price'] != null && item['price'] is num) 
                ? item['price'].toString() 
                : 'Нет цены',
              'quantity': (item['count'] != null && item['count'] is int) 
                ? item['count'].toString() 
                : 'Нет количества',
            };
          }).toList();
        });
      } else {
        throw Exception('Ошибка загрузки данных');
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Ошибка при подключении к серверу: $error'),
      ));
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.lightBlue,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Главная"),
        ],
      ),
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey[30],
                filled: true,
                label: Text('Пошук'),
                prefixIcon: Icon(Icons.search, color: Colors.black),
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
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              children: [
                Text('Глюкометры', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              height: 220,
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: List.generate(items.length, (index) {
                  return Container(
                    width: 110,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(items[index]['image']!),
                          width: 70,
                          height: 70,
                        ),
                        const SizedBox(height: 2),
                        Text(items[index]['name']!),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              children: [
                Icon(Icons.chevron_left_outlined),
                DropdownButton<String>(
                  underline: SizedBox(),
                  icon: SizedBox(),
                  value: selectedvalue,
                  hint: Text(selectedvalue ?? pickerItems[0], style: TextStyle(fontSize: 14)),
                  items: pickerItems.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedvalue = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Divider(),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: responseItems.length,
            itemBuilder: (context, index) {
              final item = responseItems[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: const EdgeInsets.only(bottom: 16),
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name']!,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text('Описание: ${item['description']}'),
                      SizedBox(height: 8),
                      Text("Цена: ${item['price']} грн."),
                      SizedBox(height: 8),
                      Text("Количество: ${item['quantity']}"),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
  }
}