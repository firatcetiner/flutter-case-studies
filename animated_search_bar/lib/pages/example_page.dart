import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:animated_search_bar/homescreen/homescreen_bloc.dart';

class ExamplePage extends StatefulWidget {

  final HomeScreenBloc bloc;
  const ExamplePage({Key key, @required this.bloc}) : super(key: key);
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {

  FocusNode _focusNode = FocusNode();

  HomeScreenBloc get _bloc => widget.bloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Column(
        children: <Widget>[
          StreamBuilder<bool>(
            stream: _bloc.searching,
            initialData: false,
            builder: (context, snapshot) {
              final _searching = snapshot.data;
              return AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: _searching ? 90 : 130,
                width: double.maxFinite,
                alignment: Alignment.centerLeft,
                curve: Curves.fastOutSlowIn,
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  boxShadow: [_searching ? BoxShadow(
                      color: Colors.deepPurpleAccent.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 20
                  ): BoxShadow()]
                ),
                child: Stack(
                  children: <Widget>[
                    !_searching ? Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Your Latest Expenses', style: TextStyle(color: Colors.white, fontSize: 25)),
                          IconButton(
                            onPressed: null,
                            icon: Icon(Icons.more_vert, size: 30, color: Colors.white,),
                          ),
                        ],
                      ),
                    ) : Container(),
                    Stack(
                      fit: StackFit.passthrough,
                      children: <Widget>[
                        AnimatedPadding(
                          curve: Curves.fastOutSlowIn,
                          duration: Duration(milliseconds: 500),
                          padding: _searching ? EdgeInsets.only(top: 30, right: 65) : EdgeInsets.only(top: 60),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            height: 46,
                            decoration: BoxDecoration(
                                color: Colors.white12,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Icon(EvaIcons.search, color: Colors.white54),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 55),
                                  child: TextFormField(
                                    focusNode: _focusNode,
                                    onTap: _bloc.onSearchOpen,
                                    style: TextStyle(color: Colors.white),
                                    cursorColor: Colors.white,
                                    scrollPadding: EdgeInsets.zero,
                                    decoration: InputDecoration.collapsed(
                                      hintText: 'Search',
                                      hintStyle: TextStyle(color: Colors.white54),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        _searching ? Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 18, left: 20),
                            child: FlatButton(
                              padding: EdgeInsets.zero,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              onPressed: () {
                                _bloc.onSearchClose();
                                _focusNode.unfocus();
                              },
                              child: Text('Cancel', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400)),
                            ),
                          ),
                        ) : Container(height: 0)
                      ],
                    ),
                  ],
                ),
              );
            }
          ),
          Expanded(
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              separatorBuilder: (context, index) => SizedBox(height: 15),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(
                          color: Colors.deepPurpleAccent.withOpacity(0.05),
                          spreadRadius: 1.5,
                          blurRadius: 10
                      )]
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[100]
                        ),
                        child: Text('$index'),
                      ),
                    ],
                  ),
                );
              },
            )
          ),
        ],
      ),
    );
  }
}
