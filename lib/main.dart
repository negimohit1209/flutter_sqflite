import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'models/user.dart';
import 'utils/database_helper.dart';

List _users;
void main() async {
  var db = DatabaseHelper();
  // int savedUser = await db.saveUser(User("Raju", "sfasd"));
  // print("User saved = $savedUser");
  //get count
  int count = await db.getCount();
  print("Count: $count"); 
  //all users
  _users = await db.getAllUsers();
  for(int i=0; i< _users.length; i++){
    User user = User.map(_users[i]);
    print("Username: ${user.username} ${user.id}");
  }

  //get a user
  User user = await db.getUser(2);
  print("username = ${user.username}");
  User upadatedUser = User.fromMap({
    "username" : "Mohit negi",
    "password" : "changedpassword",
    "id": 3
  });

  await db.updateUser(upadatedUser);

  //delet a user 
  //int user = await db.deleteUser(3);
  
  //update a user
  

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
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (_, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            title: new Text("User: ${User.fromMap(_users[index]).username}"),
            subtitle: Text("Id: ${User.fromMap(_users[index]).id}"),
            onTap: () => debugPrint("${User.fromMap(_users[index]).password}"),
          )
        );
       },
      ),
    );
  }
}
