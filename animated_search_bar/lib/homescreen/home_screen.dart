import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:animated_search_bar/homescreen/homescreen_bloc.dart';
import 'package:animated_search_bar/pages/example_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeScreenBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = HomeScreenBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<int>(
        stream: _bloc.index,
        initialData: 0,
        builder: (context, snapshot) {
          final index = snapshot.data;
          return Stack(
            children: <Widget>[
              IndexedStack(
                index: index,
                children: <Widget>[
                  ExamplePage(bloc: _bloc),
                  Container(),
                  Container(),
                  Container()
                ],
              ),
              StreamBuilder<bool>(
                stream: _bloc.searching,
                initialData: false,
                builder: (context, snapshot) {
                  final hideBottomBar = snapshot.data;
                  if(hideBottomBar) {
                    return Container(height: 0);
                  }
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 60,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      alignment: Alignment.center,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [BoxShadow(
                                      color: Colors.deepPurpleAccent.withOpacity(0.1),
                                      spreadRadius: 1.5,
                                      blurRadius: 10
                                  )]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: () {
                                        _bloc.onPageChange(page: 0);
                                      },
                                      icon: index == 0 ? Icon(EvaIcons.home, color: Colors.deepPurpleAccent) : Icon(EvaIcons.homeOutline, color: Colors.grey),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 30),
                                      child: IconButton(
                                        onPressed: () {
                                          _bloc.onPageChange(page: 1);
                                        },
                                        icon: index == 1 ? Icon(EvaIcons.activity, color: Colors.deepPurpleAccent) : Icon(EvaIcons.activityOutline, color: Colors.grey),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: IconButton(
                                        onPressed: () {
                                          _bloc.onPageChange(page: 2);
                                        },
                                        icon: index == 2 ? Icon(EvaIcons.edit2, color: Colors.deepPurpleAccent) : Icon(EvaIcons.edit2Outline, color: Colors.grey),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        _bloc.onPageChange(page: 3);
                                      },
                                      icon: index == 3 ? Icon(EvaIcons.person, color: Colors.deepPurpleAccent) : Icon(EvaIcons.personOutline, color: Colors.grey),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print('pressed');
                            },
                            onTapDown: (details) {},
                            onTapUp: (details) {},
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 0),
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 60,
                                  width: 60,
                                  child: Icon(EvaIcons.cameraOutline, color: Colors.grey, size: 30),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [BoxShadow(
                                          color: Colors.deepPurpleAccent.withOpacity(0.1),
                                          spreadRadius: 1.5,
                                          offset: Offset(0, 2),
                                          blurRadius: 3
                                      )]
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              )
            ],
          );
        }
      ),
    );
  }
}
