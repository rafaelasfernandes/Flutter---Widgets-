import 'package:flutter/material.dart';
import 'package:carros_flutter/services/login_service.dart';
import 'package:carros_flutter/utils/alert.dart';
import 'package:carros_flutter/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _tLogin = TextEditingController(); // (passar text como parametro deixa os campos ja preenchidos)
  final _tSenha = TextEditingController(); // textEditingController lê o que foi digitado nos campos de texto

  var _progress = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: _body(context),
      ),
    );
  }

  String _validateLogin(String text) {
    if (text.isEmpty) return "Informe o Login";
    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) return "Informe a senha";
    if (text.length <= 2) return "Senha precisa ter mais de 2 números";
  }

  _body(context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          TextFormField(
            controller: _tLogin,
            //vincula  campo de texto a variavel
            validator: _validateLogin,
            keyboardType: TextInputType.text,
            //mostra o teclado como texto
            style: TextStyle(color: Colors.blue, fontSize: 25),
            decoration: InputDecoration(
              labelText: "Login",
              labelStyle: TextStyle(color: Colors.black, fontSize: 25),
              hintText: "Digite o seu Login",
              hintStyle: TextStyle(color: Colors.black12, fontSize: 18),
            ),
          ),
          TextFormField(
            controller: _tSenha,
            validator: _validateSenha,
            obscureText: true,
            style: TextStyle(color: Colors.blue, fontSize: 25),
            keyboardType: TextInputType.number,
            // mostra o teclado como número
            decoration: InputDecoration(
              labelText: "Senha",
              labelStyle: TextStyle(color: Colors.black, fontSize: 25),
              hintText: "Digite a sua senha",
              hintStyle: TextStyle(color: Colors.black12, fontSize: 18),
            ),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.only(top: 20),
            child: RaisedButton(
                color: Colors.blue,
                child: _progress ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ) : Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                onPressed: () {
                  _onClickLogin(context);
                }),
          ),
        ],
      ),
    );
  }

  _onClickLogin(BuildContext context) async {
    final login = _tLogin.text; //a variavel login vai receber o texto que foi digitado,
    final senha = _tSenha.text;
    print("Login: $login || Senha: $senha");

    if (!_formKey.currentState.validate()) {
      return;
    }

    final response = await LoginService.login(login, senha);

    setState(() {
      _progress = true;
    });

    if (response.isOk()) {
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return HomePage();
      }));
    } else {
      alert(context, "ERRO", response.msg);
    }

    setState(() {
      _progress = false;
    });

  }
}
