import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

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
        style: GoogleFonts.openSans(),),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(228, 205, 205, 0.75),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://cdn.discordapp.com/attachments/1033448117703561326/1033448248385478738/AppBackground.png'),
            fit: BoxFit.cover)
        ),
        child: null,
      ),
    );
  }
}