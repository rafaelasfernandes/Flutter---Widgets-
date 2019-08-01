import 'package:flutter/material.dart';
import 'package:flutter_app_teste/models/dog.dart';
import 'package:flutter_app_teste/pages/dog_page.dart';
import 'package:flutter_app_teste/utils/nav.dart';

class HelloListView extends StatefulWidget {
  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Page Listview",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                print("Clicou na lista!");
                setState(() {
                  _gridView = false;
                });
              }),
          IconButton(
              icon: Icon(Icons.grid_on),
              onPressed: () {
                print("Clicou no grid!");
                setState(() {
                  _gridView = true;
                });
              })
        ],
      ),
      body: _body(),
    );
  }

  _img(String img) {
    //propriedade imagem
    return Image.asset(img);
  }

  _body() {
    List<Dog> dogs = [
      //retorna lista de imagens
      Dog("Jack Russel", "assets/images/dog1.png"),
      Dog("Labrador", "assets/images/dog2.png"),
      Dog("Pug", "assets/images/dog3.png"),
      Dog("Rotweiler", "assets/images/dog4.png"),
      Dog("Pastor", "assets/images/dog5.png"),
    ];

    if (_gridView) {
      return GridView.builder(
          //aula 55 gridview dinamico
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: dogs.length,
          itemBuilder: (context, index) {
            return _itemView(dogs, index);
          });
    } else {
      return ListView.builder(
          //aula 55 gridview dinamico
          itemExtent: 300,
          itemCount: dogs.length,
          itemBuilder: (context, index) {
            return _itemView(dogs, index);
          });
    }
  }

  _itemView(List<Dog> dogs, int index) {
    Dog dog = dogs[index];
    return GestureDetector( //para quando clicar na foto do cachorro ir para uma nova página
      onTap: (){
        push(context, DogPage(dog));
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _img(dog.foto),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.black45, borderRadius: BorderRadius.circular(16)),
              child: Text(
                dog.nome,
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
