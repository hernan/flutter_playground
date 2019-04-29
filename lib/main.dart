import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
//import 'package:carambula/screens/form.dart';
import 'package:carambula/screens/tabs.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     statusBarColor: Colors.amber,
  //     statusBarIconBrightness: Brightness.dark,
  //     systemNavigationBarColor: Colors.amber,
  //     systemNavigationBarIconBrightness: Brightness.dark
  //   )
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter tests',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightGreen[800],
        accentColor: Colors.amber[600],
        buttonTheme: ButtonThemeData(
//          minWidth: 100,
          buttonColor: Colors.deepOrange[600],
          textTheme: ButtonTextTheme.primary
        ),
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0),
          title: TextStyle(fontSize: 36.0),
          body1: TextStyle(fontSize: 12.0)
        )
      ),
      home: TabScreen(),
    );
  }
}
