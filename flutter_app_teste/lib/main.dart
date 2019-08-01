import 'package:flutter/material.dart';
import 'package:flutter_app_teste/pages/home_page.dart';

void main() => runApp(MyApp()); //primeira função a ser chamada

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // MaterialApp é definido apenas uma vez em todo o aplicativo
        debugShowCheckedModeBanner: false, //remove o "debug"
        theme: ThemeData(primaryColor: Colors.grey),
    home: HomePage());
  }
}


