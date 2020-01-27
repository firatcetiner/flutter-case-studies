import 'package:bloc_example/profile.dart';
import 'package:flutter/material.dart';

import 'bloc.dart';
import 'user_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  UserBloc _bloc;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _bloc = UserBloc();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Example'),
        centerTitle: true,
      ),
      body: StreamBuilder<List<User>>(
        stream: _bloc.users,
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            return IconButton(
              onPressed: () async => _bloc.getUsersAndAdd(),
              icon: Icon(Icons.refresh),
            );
          }
          if(!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 15,
                height: 15,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () async => await _bloc.getUsersAndAdd(),
            child: ListView.separated(
              physics: AlwaysScrollableScrollPhysics(),
              controller: _scrollController,
              separatorBuilder: (context, index) => Divider(height: 0, thickness: 1),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(user: snapshot.data[index])));
                  },
                  child: Hero(
                    tag: 'user_info${snapshot.data[index].id}',
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(snapshot.data[index].name),
                    ),
                  ),
                );
              },
            ),
          );
        },
      )
    );
  }
}
