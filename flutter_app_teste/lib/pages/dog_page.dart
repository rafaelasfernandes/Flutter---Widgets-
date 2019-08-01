import 'package:flutter/material.dart';
import 'package:flutter_app_teste/models/dog.dart';

class DogPage extends StatelessWidget {

  final Dog dog;
  DogPage(this.dog);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dog.nome,
        style: TextStyle(color: Colors.white),
        ),
      ),
      body: Image.asset(dog.foto),
    );
  }
}
