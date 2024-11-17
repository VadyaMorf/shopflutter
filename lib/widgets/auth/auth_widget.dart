import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  AuthWidget({Key? key}) : super(key: key);

  @override
  AuthWidgetState createState() => AuthWidgetState();
}

class AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          _LoginWidget(),
        ],
      ),
    );
  }
}

class _LoginWidget extends StatefulWidget {
  const _LoginWidget({Key? key}) : super(key: key);
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<_LoginWidget>{
  final _authTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText = null;
  
  bool isChecked = false;

  void _auth(){
    final login = _authTextController.text;
    final password = _passwordTextController.text;

    if(login.isEmpty && password.isEmpty){
      errorText = 'Заполните данные для входа';
    }else if(login.isEmpty){
      errorText = 'Заполните логин';
    }else{
      errorText = 'Заполните пароль';
    }

    if(login == 'admin' && password == 'admin'){
      print('open app');
    }else{
      print('show error');
    }
    setState(() {
      
    });
  }

  void onChanged(bool? newValue){
    setState(() {
      isChecked = newValue ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
      fontSize: 16,
      color: Colors.black
    );
    final errorText = this.errorText;
    return Padding(padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        const SizedBox(height: 50,),
        Column(
          children: [
            Icon(Icons.account_circle, color: Colors.grey,size: 160.0,)
          ],
        ),
        const SizedBox(height: 50,),
        TextField(
          controller: _authTextController,
          decoration: InputDecoration(
            label: Text('Email', style: TextStyle(
              color: Colors.lightBlue
            ),),
            filled: true,
            fillColor: Colors.white,
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
        const SizedBox(height: 16,),
        TextField(
          controller: _passwordTextController,
          obscureText: true,
          decoration: InputDecoration(
            label: Text('Пароль', style: TextStyle(
              color: Colors.lightBlue
            ),),
            filled: true,
            fillColor: Colors.white,
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
        if(errorText != null) Text(errorText, style: TextStyle(color: Colors.red, fontSize: 16),),
        const SizedBox(height: 6,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: isChecked, onChanged: onChanged, checkColor: Colors.white, activeColor: Colors.lightBlue,splashRadius: 20,
              ),
            Text('Запомнить меня', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightBlue),),
          ],
        ),
        const SizedBox(height: 165,),
        Column(
          children: [
            ElevatedButton(
              onPressed: _auth,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              ),
              child: Text('Зарегистрироваться', style: TextStyle(
                fontSize: 18,
                color: Colors.white
              )),
            ),
            const SizedBox(height: 5),
            TextButton(onPressed:(){},
            child: Text('Забыли пароль?', style: TextStyle(
              color: Colors.lightBlue,
              fontSize: 15
            ),),)
          ],
        )
      ],
    )
    );
  }
}