
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'models/user.dart';
import 'utils/database_helper.dart';

List _users;
void main() async {
  var db = DatabaseHelper();
  int savedUser = await db.saveUser(User("Mohit", "qwerty"));
  print("User saved = $savedUser");
  //all users
  _users = await db.getAllUser();
  runApp(MaterialApp(title: 'database', home: Home()));
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Database"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,

      ),
    );
  }
}
