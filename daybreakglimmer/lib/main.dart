// ignore_for_file: prefer_const_constructors, must_call_super

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => {
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: Colors.transparent)),
      runApp(EarthSaviours())
    };

class EarthSaviours extends StatelessWidget {
  const EarthSaviours({Key? key}) : super(key: key);
  //root application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _Splashscreen(),
    );
  }
}

class _Splashscreen extends StatefulWidget {
  const _Splashscreen({Key? key}) : super(key: key);

  @override
  State<_Splashscreen> createState() => __SplashscreenState();
}

class __SplashscreenState extends State<_Splashscreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LogInSignIn())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: const [
              Color.fromRGBO(228, 205, 205, 0.75),
              Color.fromRGBO(161, 91, 91, 0.75)
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              'https://media.discordapp.net/attachments/1033448117703561326/1033601816224595978/logowithoutbg.png?width=499&height=499',
              height: 300,
              width: 300,
            )
          ],
        ),
      ),
    );
  }
}

class LogInSignIn extends StatelessWidget {
  const LogInSignIn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Helping Hands',
            style: TextStyle(fontFamily: 'Arial Rounded MT Bold')),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(228, 205, 205, 0.75),
        foregroundColor: Colors.black,
        shadowColor: Colors.black,
        elevation: 20,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://cdn.discordapp.com/attachments/1033448117703561326/1033448248385478738/AppBackground.png'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints.tight(Size(300, 300)),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://media.discordapp.net/attachments/1033448117703561326/1033601816224595978/logowithoutbg.png?width=499&height=499'))),
            ),
            PhysicalModel(
              color: Color.fromRGBO(228, 205, 205, 0.75),
              shadowColor: Colors.black,
              elevation: 20,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                  constraints: BoxConstraints.tight(Size(400, 200)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 180,
                        margin: EdgeInsets.all(2.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromRGBO(161, 91, 91, 0.75),
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Color.fromRGBO(228, 205, 205, 0.75);
                                }
                                return Color.fromRGBO(161, 91, 91,
                                    0.75); // Use the component's default.
                              }, //161, 91, 91, 0.75
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const Login();
                            }));
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontFamily: 'Arial Rounded MT Bold',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 180,
                        margin: EdgeInsets.all(2.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromRGBO(161, 91, 91, 0.75),
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Color.fromRGBO(228, 205, 205, 0.75);
                                }
                                return Color.fromRGBO(161, 91, 91,
                                    0.75); // Use the component's default.
                              }, //161, 91, 91, 0.75
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()));
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontFamily: 'Arial Rounded MT Bold',
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),

            //Images
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: BoxConstraints.tight(Size(150, 150)),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://media.discordapp.net/attachments/1033448117703561326/1033633180453961799/1630133662558_1.png?width=565&height=499'),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  constraints: BoxConstraints.tight(Size(150, 150)),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://media.discordapp.net/attachments/1033448117703561326/1033633396443848714/zenith_logo_without_bg.png'),
                          fit: BoxFit.fill)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

//* Login page starts from here.

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'T.E.S.F',
          style: TextStyle(fontFamily: 'Arial Rounded MT Bold'),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(228, 205, 205, 0.75),
        foregroundColor: Colors.black,
        shadowColor: Colors.black,
        elevation: 20,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://cdn.discordapp.com/attachments/1033448117703561326/1033448248385478738/AppBackground.png'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: 350,
                height: 900,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(228, 205, 205, 0.75),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Color.fromRGBO(228, 205, 205, 0.75);
                        }
                        return Color.fromRGBO(
                            161, 91, 91, 0.75); // Use the component's default.
                      }, //161, 91, 91, 0.75
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text(
                    '->',
                    style: TextStyle(
                      fontFamily: 'Arial Rounded MT Bold',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//? SignIn PAGE
class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'T.E.S.F',
          style: TextStyle(fontFamily: 'Arial Rounded MT Bold'),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(228, 205, 205, 0.75),
        foregroundColor: Colors.black,
        shadowColor: Colors.black,
        elevation: 20,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://cdn.discordapp.com/attachments/1033448117703561326/1033448248385478738/AppBackground.png'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: 350,
                height: 900,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(228, 205, 205, 0.75),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//? Home Page

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Home', style: TextStyle(fontFamily: 'Arial Rounded MT Bold')),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(228, 205, 205, 0.75),
        foregroundColor: Colors.black,
        shadowColor: Colors.black,
        elevation: 20,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://cdn.discordapp.com/attachments/1033448117703561326/1033448248385478738/AppBackground.png'),
                fit: BoxFit.cover),
                ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(161, 91, 91, 0.75),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            IconButton(onPressed: null, icon: Icon(Icons.warning_rounded), tooltip: 'Notifications', iconSize: 36,),
            IconButton(onPressed: null, icon: Icon(Icons.home_filled), tooltip: 'Home', iconSize:36,),
            IconButton(onPressed: null, icon: Icon(Icons.person), tooltip: 'Profile', iconSize: 36,),
          ],
        ),
      ),
    );
  }
}
