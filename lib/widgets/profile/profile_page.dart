
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final List<BorderRowData> borderRow = [
    BorderRowData(Icons.medication, 'Как экономить?'),
    BorderRowData(Icons.medication, 'Избранные товары'),
    BorderRowData(Icons.medication, 'Мои покупки'),
    BorderRowData(Icons.medication, 'Мои магазины'),
    BorderRowData(Icons.medication, 'Ирегаторы'),
    BorderRowData(Icons.medication, 'Настройки'),
    BorderRowData(Icons.medication, 'Обратная связь'),
    BorderRowData(Icons.medication, 'Пользоветльская информация'),
  ];
  ProfilePage();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(16),
          child: 
          Row(
            children: [
              Text('Личный кабинет',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Calibri',
                  ),)
            ],
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
      color: Colors.transparent,
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