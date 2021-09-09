import 'package:corona_tracker/datasource.dart';
import 'package:corona_tracker/homepage.dart';
import 'package:corona_tracker/pages/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  

          return MaterialApp(
            debugShowCheckedModeBanner:
                false, //Turns on a little "DEBUG" banner in checked mode to indicate that the app is in checked mode. This is on by default (in checked mode), to turn it off, set the constructor argument to false. In release mode this has no effect.

            themeMode:ThemeMode.system,
            theme: Themes.lighttheme,
            darkTheme: Themes.darktheme,

            home: Homepage(),
          );
        
  }
}
