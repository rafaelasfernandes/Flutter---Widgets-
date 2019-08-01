import 'package:flutter/material.dart';

class GreyButton extends StatelessWidget {
  String text;
  Function onPressed;
  Color color; //se não for informado uma cor p/ o botão, ele irá assumir a cor grey
// criando um botão para não ficar repetindo código

  GreyButton(this.text, {this.onPressed, this.color = Colors.grey}); //entre chaves são parametros opcionais

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: Colors.grey,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onPressed: onPressed);
  }
}
