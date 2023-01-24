import 'package:dark_light_ui/home_screen.dart';
import 'package:dark_light_ui/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ThemeProvider>(
      create: (context) {

        
        return ThemeProvider()..initialize();// it is a cascade operator in dart,
        /*  
        Cascade  notation in dart is syntactic sugar in Dart that allows you to make a sequence of operation on the same object.You can use the "double dot"
        to call function on objects and access properties.This "operator" is simply used to make your code cleaner and concise.        
        */
      },
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, provider, _) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: provider.themeMode,
        home: const HomeScreen(),
      );
    });
  }
}
