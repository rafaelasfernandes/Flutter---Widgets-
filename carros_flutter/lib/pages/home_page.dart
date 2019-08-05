import 'package:flutter/material.dart';
import 'package:carros_flutter/models/carro.dart';
import 'package:carros_flutter/services/carro_service.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: FutureBuilder<List<Carro>>(
          future: CarroService.getCarros(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Nenhum carro disponível.",
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.grey,
                  ),
                ),
              );
            } else if (!snapshot.hasData) {
              return Center(
                  child:
                      CircularProgressIndicator()); //"carregando" até aparecer a página com os carros
            } else {
              return _listView(snapshot.data);
            }
          }),
    );
  }

  _listView(List<Carro> carros) {
    return ListView.builder(
        itemCount: carros.length,
        itemBuilder: (contexto, indice) {
          final c = carros[indice];

          return Container(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Image.network(
                        c.urlFoto,
                        width: 150,
                      ),
                    ),
                    Text(
                      c.nome,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      c.desc,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    ButtonTheme.bar(
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: const Text('DETALHES'),
                            onPressed: () {
                              /* ... */
                            },
                          ),
                          FlatButton(
                            child: const Text('SHARE'),
                            onPressed: () {
                              /* ... */
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
