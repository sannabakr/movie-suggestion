import 'package:flutter/material.dart';

import './screens/filterations_screen.dart';
import 'package:provider/provider.dart';
import './providers/movies.dart';
import './screens/movies_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Movies(),
      child: MaterialApp(
        title: 'My Movie Suggestion app',
        theme: ThemeData(
          backgroundColor: Color.fromRGBO(24, 37, 31, 1),
          primaryColorDark:Color.fromRGBO(24, 37, 31, 1),
          primaryColorLight:Color.fromRGBO(220, 238, 209, 1) ,
          accentColor: Color.fromRGBO(156, 137, 184, 1),
          //primarySwatch: Colors.grey,
          //accentColor: Colors.pink[300],
          textTheme: TextTheme(
            headline1: TextStyle(
              color: Color.fromRGBO(240, 244, 240, 0.85),
              //color:Color.fromRGBO(220, 238, 209, 1), //little bit green-ish
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            headline2: TextStyle(
              color: Color.fromRGBO(24, 37, 31, 1),
              fontSize:  18,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
            ),
            headline3: TextStyle(
              color: Color.fromRGBO(220, 238, 209, 1),
              fontSize:  18,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => FilterationsScreen(),
          MoviesScreen.routeName: (ctx) => MoviesScreen(),
        },
      ),
    );
  }
}
