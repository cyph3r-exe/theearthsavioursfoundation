import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const LogInSignIn()); 
class LogInSignIn extends StatelessWidget {
  const LogInSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://cdn.discordapp.com/attachments/1033448117703561326/1033448248385478738/AppBackground.png'),
          fit: BoxFit.cover)
      ),
      child: null
    );
  }
}