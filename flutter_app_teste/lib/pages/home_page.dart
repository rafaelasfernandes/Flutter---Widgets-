import 'package:flutter/material.dart';
import 'package:flutter_app_teste/pages/hello_page1.dart';
import 'package:flutter_app_teste/pages/hello_page2.dart';
import 'package:flutter_app_teste/pages/hello_page3.dart';
import 'package:flutter_app_teste/widgets/grey_button.dart';
import 'package:flutter_app_teste/utils/nav.dart';
import 'package:flutter_app_teste/pages/hello_listview.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_app_teste/drawer_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // em cada tela que for feita será colocado o Scaffold (permite que adicione outros widgets do material design)
        appBar: AppBar(
          title: Text(
            "Hello Flutter",
            style: TextStyle(color: Colors.white),
          ),
          bottom: TabBar(tabs: [
            Tab(text: "TAB 1",),
            Tab(text: "TAB 2",),
            Tab(text: "TAB 3",),
          ],),
          centerTitle: true,
        ),
        body: TabBarView(children: [
          _body(context),
          Container(
            color: Colors.grey,
          ),
          Container(
            color: Colors.purple,
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _onClickFab(),
        ),
        drawer: DrawerList(),
      ),
    );
  }

  _onClickFab() {
    print("Adicionar!");
  }

  _body(BuildContext context) {
    //propriedade body (o retorno no flutter é opcional)
    return Container(
      padding: const EdgeInsets.all(16),
      child: Container(
        //body onde ficará o layout
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _text(),
            _pageView(),
            _buttons(context),
          ],
        ),
      ),
    );
  }

  _pageView() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: 300,
      child: PageView(
        children: <Widget>[
          _img("assets/images/dog1.png"),
          _img("assets/images/dog2.png"),
          _img("assets/images/dog3.png"),
          _img("assets/images/dog4.png"),
          _img("assets/images/dog5.png"),
        ],
      ),
    );
  }

  _buttons(BuildContext context) {
    return Builder(
      builder: (context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GreyButton("Listview",
                    onPressed: () =>
                        _onClickNavigator(context, HelloListView())),
                GreyButton("Page 2",
                    onPressed: () => _onClickNavigator(context, HelloPage2())),
                GreyButton("Page 3",
                    onPressed: () => _onClickNavigator(context, HelloPage3())),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GreyButton("Snack", onPressed: () => _onClickSnack(context)),
                GreyButton("Dialog", onPressed: () => _onClickDialog(context)),
                GreyButton("Toast", onPressed: () => _onClickToast()),
              ],
            ),
          ],
        );
      },
    );
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    //await e async (retorna dados futuros)
    String s = await push(context, page);
    print(">> $s");
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "Olá, Flutter!!!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  _onClickDialog(context) {
    showDialog(
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            //não fecha o alerta se clicar no botão voltar ou fora da caixa de diálogo
            child: AlertDialog(
              title: Text("Flutter é muito legal"),
              actions: <Widget>[
                FlatButton(
                    child: Text("CANCELAR"),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                      print("OK!!!");
                    }),
              ],
            ),
          );
        });
  }

  _onClickSnack(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Olá Flutter"),
      action: SnackBarAction(
          label: "OK",
          onPressed: () {
            print("OK!");
          }),
    ));
  }

  _img(String img) {
    //propriedade imagem
    return Image.asset(img);
  }

  _text() {
    //propriedade texto
    return Text(
      "Hello Word",
      style: TextStyle(
          //propriedades do textStyle
          fontSize: 30,
          color: Colors.black12,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          //adiciona linha
          decorationColor: Colors.grey //cor da linha
          ),
    );
  }
}
