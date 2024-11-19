import 'package:flutter/material.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                  'Корзина',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Calibri',
                  ),
              ),
            ],
          ),),
          const Divider(color: Color.fromRGBO(169, 169, 169, 0.5),height: 0.5,),
          const SizedBox(height: 210,),
          Text('Корзина пустая =(',style: TextStyle(
                    fontSize: 20,fontWeight: FontWeight.w600,
                    fontFamily: 'Calibri',
                  ),),
          const SizedBox(height: 8,),
          Row(
            children: [
              Expanded(
                child:Padding(padding: EdgeInsets.symmetric(horizontal: 16),
                child: 
                Text('Сделайте бронь и вы точно будете уверенны, что забронированные товары ждут вас в нашем магазине',
                textAlign: TextAlign.center,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),)),
              )
            ],
          ),
          const SizedBox(height: 16,),
          ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 100),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min, 
            children: [
              Text(
                'Перейти к поиску',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(width: 8), 
              const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(onPressed: (){}, 
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 110),
          ),
          child: Text('Как сделать заказ?', style: TextStyle(fontSize: 16, color: Colors.lightBlue),))
        ],
      ),
    );
  }
}