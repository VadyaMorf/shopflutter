import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_popup/flutter_popup.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  List<Map<String, String>> items = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController countController = TextEditingController();
  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> createProduct(String title, String description, int price, int count) async{
    final url = 'http://10.0.2.2:5132/Products';

    final newProduct = {
      "title": title,
      "description": description,
      "price": price ,
      "count": count,
    };

    try{
      final response = await http.post(Uri.parse(url), headers: {'Content-Type': 'application/json'}, body: json.encode((newProduct)));

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Товар успешно создан!')),
        );
        fetchItems(); 
      } else {
        throw Exception('Ошибка создания товара');
      }
    }
    catch(error){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка при создании товара: $error')),
      );
    }
  }

  Future<void> fetchItems() async {
    final url = 'http://10.0.2.2:5132/Products';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);

        setState(() {
          items = data.map((item) {
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
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  'Создание товара',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Calibri',
                  ),
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(context: context, 
              barrierDismissible: true, 
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16), 
                  ),
                  content: PopupWidget(
                      titleController: titleController,
                      descriptionController: descriptionController,
                      priceController: priceController,
                      countController: countController,
                      onSave: (title, description, price, count) {
                        createProduct(title, description, price, count);
                      },
                  ),
                );
              },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            ),
            child: Text(
              'Добавить товар',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
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
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
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
          ),
        ],
      ),
    );
  }
}

class PopupWidget extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  final TextEditingController countController;
  final Function(String title, String description, int price, int count) onSave;
  const PopupWidget({
    required this.titleController,
    required this.descriptionController,
    required this.priceController,
    required this.countController,
    required this.onSave,
    super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min, 
        children: [
          Text(
            'Добавить новый товар',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              label: Text('Название'),
              filled: true,
              fillColor: Colors.transparent,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(169, 169, 169, 0.5)),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(169, 169, 169, 0.5)),
                borderRadius: BorderRadius.circular(15),
              ),
            )
          ),
          const SizedBox(height: 12),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              label: Text('Описание'),
              filled: true,
              fillColor: Colors.transparent,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(169, 169, 169, 0.5)),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(169, 169, 169, 0.5)),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: priceController,
            decoration: InputDecoration(
              label: Text('Цена'),
              filled: true,
              fillColor: Colors.transparent,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(169, 169, 169, 0.5)),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(169, 169, 169, 0.5)),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: countController,
            decoration: InputDecoration(
              label: Text('Количество'),
              filled: true,
              fillColor: Colors.transparent,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(169, 169, 169, 0.5)),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(169, 169, 169, 0.5)),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              final title = titleController.text;
              final description = descriptionController.text;
              final price = int.tryParse(priceController.text) ?? 0;
              final count = int.tryParse(countController.text) ?? 0;
              
              onSave(title, description, price, count);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 80),
              ),
            child: Text('Сохранить'),
          ),
        ],
      ),
    );
  }
}

