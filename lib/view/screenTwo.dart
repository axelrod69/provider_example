import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/controller/counterController.dart';
import 'package:provider_example/controller/userController.dart';

class ScreenTwo extends StatefulWidget {
  ScreenTwoState createState() => ScreenTwoState();
}

class ScreenTwoState extends State<ScreenTwo> {
  @override
  void initState() {
    // TODO: implement initState

    Provider.of<UserController>(context, listen: false).getUsers();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenTwo = Provider.of<CounterController>(context);
    final userProvider = Provider.of<UserController>(context);

    // TODO: implement build
    return Scaffold(
      body: userProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: userProvider.userModel.length,
              itemBuilder: (context, index) =>
                  Text(userProvider.userModel[index].name.toString())),
    );
  }
}
