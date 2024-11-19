import 'package:flutter/material.dart';

class CatalogWidget extends StatelessWidget {
  final List<BorderRowData> borderRow = [
    BorderRowData(Icons.medication, 'Бандажи'),
    BorderRowData(Icons.medication, 'Тонометры'),
    BorderRowData(Icons.medication, 'Ингаляторы'),
    BorderRowData(Icons.medication, 'Глюкометры'),
    BorderRowData(Icons.medication, 'Ирегаторы'),
    BorderRowData(Icons.medication, 'Слуховые аппараты'),
    BorderRowData(Icons.medication, 'Массажеры'),
    BorderRowData(Icons.medication, 'Компрессионный трикотаж'),
    BorderRowData(Icons.medication, 'Стельки ортопедические'),
    BorderRowData(Icons.medication, 'Подушки ортопедические'),
    BorderRowData(Icons.medication, 'Аппликаторы'),
    BorderRowData(Icons.medication, 'Обувь ортопедическая'),
    BorderRowData(Icons.medication, 'Медицинское оборудование'),
  ];

  CatalogWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                Text(
                  'Каталог товаров',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Calibri',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                label: Text('Поиск...'),
                filled: true,
                fillColor: Colors.grey[10],
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              ),
            ),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: BorderWidget(borderRow: borderRow),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BorderRowData {
  final IconData icon;
  final String text;

  BorderRowData(this.icon, this.text);
}

class BorderWidget extends StatelessWidget {
  final List<BorderRowData> borderRow;
  const BorderWidget({Key? key, required this.borderRow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: borderRow
          .map((data) => Column(
                children: [
                  BorderItems(data: data),
                  Divider(
                    color: Color.fromRGBO(169, 169, 169, 0.5),
                    height: 0.5,
                  ),
                ],
              ))
          .toList(),
    );
  }
}

class BorderItems extends StatelessWidget {
  final BorderRowData data;
  const BorderItems({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        children: [
          Icon(
            data.icon,
            size: 30.0,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              data.text,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
