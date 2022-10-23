// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// ignore: unused_import

void main() => runApp(EarthSaviours());

class EarthSaviours extends StatelessWidget {
  const EarthSaviours({Key? key}) : super(key: key);
  //root application
  @override 
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LogInSignIn(),
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
        style: TextStyle(
          fontFamily: 'Arial Rounded MT Bold'
        )),
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
            image: NetworkImage('https://cdn.discordapp.com/attachments/1033448117703561326/1033448248385478738/AppBackground.png'),
            fit: BoxFit.cover)
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints.tight(Size(300, 300)),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://media.discordapp.net/attachments/1033448117703561326/1033601816224595978/logowithoutbg.png?width=499&height=499'))
                ),
              ),
              PhysicalModel(color: Color.fromRGBO(228, 205, 205, 0.75),
              shadowColor: Colors.black,
              elevation: 20,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                constraints: BoxConstraints.tight(Size(400,200)),
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
                      child: ElevatedButton(onPressed: null, 
                        child: Text('Login',
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
                      child: ElevatedButton(onPressed: null, 
                        child: Text('Sign In',
                        style: TextStyle(
                          fontFamily: 'Arial Rounded MT Bold',
                        ),
                        ),
                      ),
                    ),
                  ],
                )
              ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    constraints: BoxConstraints.tight(
                      Size(150, 150)
                    ),
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        image: NetworkImage('https://media.discordapp.net/attachments/1033448117703561326/1033633180453961799/1630133662558_1.png?width=565&height=499'),
                        fit: BoxFit.fill
                    ),
                  ),
                  ),
                  Container(
                    constraints: BoxConstraints.tight(
                      Size(150, 150)
                    ),
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        image: NetworkImage('https://media.discordapp.net/attachments/1033448117703561326/1033633396443848714/zenith_logo_without_bg.png'),
                        fit: BoxFit.fill)
                    ),
                  ),
                ],
              )
            ],
          ),
      ),
    );
  }
}