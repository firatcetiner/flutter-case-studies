import 'package:bloc_example/repository.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'user_model.dart';

class UserBloc {

  final  _controller = ReplaySubject<List<User>>();

  List<User> _allUsers = List<User>();

  Stream<List<User>> get users => _controller.stream;

  UserBloc() {
    getUsersAndAdd();
  }

  Future<void> getUsersAndAdd() async {
    var watch = Stopwatch()..start();
    return await compute(fetchUsers, 'https://jsonplaceholder.typicode.com/users')
    .then((users) {
      _allUsers = users.map<User>((json) => User.fromJson(json)).toList();
      _controller.sink.add(_allUsers);
    })
    .catchError((error) {
      print('Error: Could not fetch the users -> $error');
      _controller.sink.addError(error);
    })
    .whenComplete(() {
      print(watch.elapsedMilliseconds);
    });
  }

  void dispose() {
    _controller.close();
  }
}