import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/welcoming_screen_bloc.dart';
import 'bloc/welcoming_screen_event.dart';
import 'bloc/welcoming_screen_state.dart';

class WelcomingScreen extends StatefulWidget {

  const WelcomingScreen({Key key}) : super(key: key);
  @override
  _WelcomingScreenState createState() => _WelcomingScreenState();
}
class _WelcomingScreenState extends State<WelcomingScreen> with TickerProviderStateMixin {


  AnimationController _animationController;

  WelcomingScreenBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<WelcomingScreenBloc>(context);
    _animationController = AnimationController(
      vsync: this,
      value: 1,
      upperBound: 1,
      lowerBound: 0,
      duration: Duration(milliseconds: 400),
      reverseDuration: Duration(milliseconds: 400)
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget _signUpForm = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20
          ),
          child: GestureDetector(
            onPanDown: (details) {

            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(EvaIcons.arrowIosBack, size: 30),
                  onPressed: () {
                    _animationController.reverse().whenComplete(() {
                      _bloc..add(OpenWelcome());
                      _animationController.forward();
                    });
                  },
                ),
                Text('Login', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                IconButton(
                  icon: Icon(EvaIcons.arrowIosBackOutline, size: 30, color: Colors.transparent),
                  onPressed: null,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 2, color: Colors.grey)
                ),
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    onTap: () {

                    },
                    decoration: InputDecoration.collapsed(
                        hintText: 'Email'
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(width: 2, color: Colors.grey)
                ),
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    decoration: InputDecoration.collapsed(
                        hintText: 'Password'
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {

                },
                child: Container(
                  height: 55,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(40)
                  ),
                  child: Text('LOGIN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22)),
                ),
              ),
              GestureDetector(
                onTap: () {

                },
                child: Container(
                  height: 55,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(40)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(EvaIcons.google, color: Colors.white),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text('Sign in with Google', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22)),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _animationController.reverse().whenComplete(() {
                  _bloc..add(OpenRegister());
                  _animationController.forward();
                  });
                },
                child: Container(
                  height: 55,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(width: 2, color: Colors.black)
                  ),
                  child: Text('CREATE AN ACCOUNT', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22)
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
    Widget _registerForm = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(EvaIcons.arrowIosBackOutline, size: 30),
                onPressed: () {
                  _animationController.reverse().whenComplete(() {
                    _bloc..add(OpenWelcome());
                    _animationController.forward();
                  });
                },
              ),
              Text('Register', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              IconButton(
                icon: Icon(EvaIcons.arrowIosBackOutline, size: 30, color: Colors.transparent),
                onPressed: null
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(width: 2, color: Colors.grey)
                ),
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    decoration: InputDecoration.collapsed(
                        hintText: 'Name'
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(width: 2, color: Colors.grey)
                ),
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    decoration: InputDecoration.collapsed(
                        hintText: 'Email'
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(width: 2, color: Colors.grey)
                ),
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    decoration: InputDecoration.collapsed(
                        hintText: 'Password'
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {

                },
                child: Container(
                  height: 55,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(40)
                  ),
                  child: Text('REGISTER', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22)),
                ),
              ),
            ],
          ),
        )
      ],
    );
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/background.png'), fit: BoxFit.cover),
            )
          ),
          BlocBuilder<WelcomingScreenBloc, WelcomingScreenState>(
            builder: (context, state) {
              return AnimatedBuilder(
                animation: _animationController,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: state.margin),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)
                      )
                  ),
                  child: BlocBuilder<WelcomingScreenBloc, WelcomingScreenState>(
                    builder: (context, state) {
                      if(state is LoginOpened) {
                        return _signUpForm;
                      }
                      if(state is RegisterOpened) {
                        return _registerForm;
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Column(
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Icon(EvaIcons.creditCardOutline, size: 80, color: Colors.deepPurpleAccent.withOpacity(0.5)),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Icon(EvaIcons.creditCard, size: 80, color: Colors.black,),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Create, search and organize your expenses with a modern and dynamic way',
                                  style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  _animationController.reverse().whenComplete(() {
                                    _bloc..add(OpenRegister());
                                    _animationController.forward();
                                  });
                                },
                                child: Container(
                                  height: 55,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(40)
                                  ),
                                  child: Text('SIGN UP', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22)),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _animationController.reverse().whenComplete(() {
                                    _bloc..add(OpenLogin());
                                    _animationController.forward();
                                  });
                                },
                                child: Container(
                                  height: 55,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all(width: 2, color: Colors.black)
                                  ),
                                  child: Text('LOGIN', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22)),
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  )
                ),
                builder: (context, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(0, 1),
                      end: Offset(0,0)
                    ).animate(CurvedAnimation(
                      curve: Curves.fastOutSlowIn,
                      parent: _animationController
                    )),
                    child: child,
                  );
                },
              );
            },
          ),
        ],
      )
    );
  }
}
