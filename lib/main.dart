import 'package:flutter/material.dart';
import 'package:flutterproveder/notifier/auth_notifier.dart';
import 'package:flutterproveder/notifier/food_notifier.dart';
import 'package:flutterproveder/screens/feed.dart';
import 'package:flutterproveder/screens/login.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => AuthNotifier()),
      ChangeNotifierProvider(create: (context) => FoodNotifier())
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:
          ThemeData(primarySwatch: Colors.deepPurple, accentColor: Colors.blue),
      home: Consumer<AuthNotifier>(
        builder: (context, notifier, child) {
          return notifier.user == null ? Login() : Feed();
        },
        child: Login(),
      ),
    );
  }
}
