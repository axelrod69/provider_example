import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/controller/counterController.dart';
import 'package:provider_example/controller/userController.dart';
import 'package:provider_example/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterController()),
        ChangeNotifierProvider(create: (context) => UserController())
      ],
      child: Routes(),
    );
  }
}
