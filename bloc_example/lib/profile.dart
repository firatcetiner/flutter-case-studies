import 'package:bloc_example/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {

  final User user;

  const ProfilePage({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'user_info${user.id}',
          child: Material(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
              ),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.security),
                      Text(user.id.toString())
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.security),
                      Text(user.id.toString())
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.security),
                      Text(user.id.toString())
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.security),
                      Text(user.id.toString())
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}