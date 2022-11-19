// ignore_for_file: prefer_const_constructors, must_call_super, must_be_immutable, avoid_print, use_build_context_synchronously, depend_on_referenced_packages

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => {
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: Colors.transparent)),
      runApp(EarthSaviours())
    };

void _homepage(BuildContext context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => Homepage()));
}

void _adminhomepage(BuildContext context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => AdminHomepage()));
}

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

void loginalert(BuildContext context) {
  final alert = AlertDialog(
    title: const Text('Login Failed'),
    content: const Text('Username or Password was incorrect'),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Retry'),
      )
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
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

//* Main login and sign in page common for all.
//* This will be starting point of the app after the splash screens
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
                              return Login();
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
                            'Sign Up', 
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

//? Home Page
class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          UserPost())); //replace with posts screen
            },
            icon: Icon(Icons.post_add),
            iconSize: 36,
            tooltip: 'Help Post',
          )
        ],
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
          children:  [
            IconButton(
              onPressed: null,
              icon: Icon(Icons.warning_rounded),
              tooltip: 'Notifications',
              iconSize: 36,
            ),
            IconButton(
              onPressed: null,
              icon: Icon(Icons.home_filled),
              tooltip: 'Home',
              iconSize: 36,
            ),
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Profile()));
              },
              icon: Icon(Icons.person),
              tooltip: 'Profile',
              iconSize: 36,
            ),
          ],
        ),
      ),
    );
  }
}

//? Admin home page for admins to create posts as well, and receive notifications curated for them only.
class AdminHomepage extends StatelessWidget {
  const AdminHomepage({Key? key}) : super(key: key);

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
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AdminPost())); //replace with posts screen
            },
            icon: Icon(Icons.post_add),
            iconSize: 36,
            tooltip: 'Help Post',
          )
        ],
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
            IconButton(
              onPressed: null,
              icon: Icon(Icons.warning_rounded),
              tooltip: 'Notifications',
              iconSize: 36,
            ),
            IconButton(
              onPressed: null,
              icon: Icon(Icons.home_filled),
              tooltip: 'Home',
              iconSize: 36,
            ),
            IconButton(
              onPressed: null,
              icon: Icon(Icons.person),
              tooltip: 'Profile',
              iconSize: 36,
            ),
          ],
        ),
      ),
    );
  }
}

//* Login page starts from here. Point to be noted here is
//* once the user enters password for login, user will be checked if it is admin or not,
//* If the user is an admin and the password given is correct, then AdminHomePage will load
//* Else the user is a normal user and the password given is correct, then HomePage will load.

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  TextEditingController loginuserController = TextEditingController();
  TextEditingController loginpassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'T.E.S.F Login',
          style: TextStyle(fontFamily: 'Arial Rounded MT Bold'),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(228, 205, 205, 0.75),
        foregroundColor: Colors.black,
        shadowColor: Colors.black,
        elevation: 20,
      ),
      body: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://cdn.discordapp.com/attachments/1033448117703561326/1033448248385478738/AppBackground.png'),
                fit: BoxFit.cover)),
        child: PhysicalModel(
          color: Colors.transparent,
          shadowColor: Colors.black,
          elevation: 20,
          child: Container(
            width: 350,
            height: 300,
            decoration: BoxDecoration(
                color: Color.fromRGBO(228, 205, 205, 0.75),
                borderRadius: BorderRadius.circular(15)),
            child: ListView(children: [
              Container(
                alignment: Alignment.center,
                width: 200,
                height: 50,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(161, 91, 91, 0.75)),
                child: Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 24,
                    fontFamily: 'Arial Rounded MT Bold',
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: TextFormField(
                  controller: loginuserController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0)),
                    labelText: 'Username',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: TextFormField(
                  controller: loginpassController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0)),
                    labelText: 'Password',
                  ),
                ),
              ),
              TextButton(
                  onPressed: () async {
                    var url = Uri.parse(
                        'https://daybreaklimit.herokuapp.com/auth/login');

                    var response = await http.post(url, body: {
                      'user[username]': loginuserController.text,
                      'user[password]': loginpassController.text,
                    });
                    
                    if (response.statusCode == 200) {
                      var decResponse = jsonDecode(response.body);
                      var tokenvalue = decResponse['token'];
                      var refreshtokenvalue = decResponse['refresh_token'];
                      print(tokenvalue);
                      print(refreshtokenvalue);

                      var authurl = Uri.parse('https://daybreaklimit.herokuapp.com/users/me');

                      var authresponse = await http.get(authurl, headers: {
                        "Authorization" : "$tokenvalue"
                      });
                      
                      if (authresponse.statusCode == 200){
                        var authadmin = jsonDecode(authresponse.body);
                        var user = authadmin['user'];
                        var authuser = user['admin'];
                        print(authuser);

                        if (authuser == true) {
                          return _adminhomepage(context);
                        } else {
                          return _homepage(context);
                        }

                      } 
                      print(authresponse.body);
                      
                    }
                    if (response.statusCode == 401) {
                      print(response.body);
                      return loginalert(context);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 50,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(161, 91, 91, 0.75),
                    ),
                    child: Text(
                      'Proceed',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Arial Rounded MT Bold',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}

//? SignIn PAGE
class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactnumberController = TextEditingController();

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

      //!Body of Sign In Page
      body: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://cdn.discordapp.com/attachments/1033448117703561326/1033448248385478738/AppBackground.png'),
                fit: BoxFit.cover)),
        child: PhysicalModel(
          color: Colors.transparent,
          shadowColor: Colors.black,
          elevation: 20,
          child: Container(
            width: 350,
            height: 600,
            decoration: BoxDecoration(
                color: Color.fromRGBO(228, 205, 205, 0.75),
                borderRadius: BorderRadius.circular(15)),
            child: ListView(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 50,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(161, 91, 91, 0.75)),
                  child: Text(
                    'Sign Up',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 24,
                      fontFamily: 'Arial Rounded MT Bold',
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: fnameController,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0)),
                      labelText: 'First Name',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: lnameController,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0)),
                      labelText: 'Last Name',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: usernameController,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0)),
                      labelText: 'Username',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: passwordController,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0)),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: emailController,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0)),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: contactnumberController,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0)),
                      labelText: 'Contact Number',
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () async {
                      var url =
                          Uri.parse('https://daybreaklimit.herokuapp.com/user');
                      var response = await http.post(url, body: {
                        'user[first_name]': fnameController.text,
                        'user[last_name]': lnameController.text,
                        'user[username]': usernameController.text,
                        'user[password]': passwordController.text,
                        'user[mail]': emailController.text,
                        'user[phone]': contactnumberController.text,
                      });
                      if (response.statusCode == 200) {
                        print(response.body);
                        return _homepage(context);
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 50,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(161, 91, 91, 0.75),
                      ),
                      child: Text(
                        'Proceed',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Arial Rounded MT Bold',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: TextButton(onPressed: null, child: Text('Forgot Password?')),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',
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
              fit: BoxFit.cover),
        ),

        //* Profile page body of the person viewing the app.

        child: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://cdn.discordapp.com/attachments/1033448117703561326/1033448248385478738/AppBackground.png'),
                fit: BoxFit.cover)),
        child: PhysicalModel(
          color: Colors.transparent,
          shadowColor: Colors.black,
          elevation: 20,
          child: Container(
            width: 350,
            height: 600,
            decoration: BoxDecoration(
                color: Color.fromRGBO(228, 205, 205, 0.75),
                borderRadius: BorderRadius.circular(15)),
      ),
        )
        )
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(161, 91, 91, 0.75),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            IconButton(
              onPressed: null,
              icon: Icon(Icons.warning_rounded),
              tooltip: 'Notifications',
              iconSize: 36,
            ),
            IconButton(
              onPressed: null,
              icon: Icon(Icons.home_filled),
              tooltip: 'Home',
              iconSize: 36,
            ),
            IconButton(
              onPressed: null,
              icon: Icon(Icons.person),
              tooltip: 'Profile',
              iconSize: 36,
            ),
          ],
        ),
      ),
    );
  }
}

class AdminPost extends StatelessWidget {
   AdminPost({Key? key}) : super(key: key);
  
  TextEditingController headingController = TextEditingController();
  TextEditingController descriptionController= TextEditingController();
  TextEditingController requirementsController= TextEditingController();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title:
            Text('Post', style: TextStyle(fontFamily: 'Arial Rounded MT Bold')),
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

        //* Admin post page page body of the person viewing the app.
        //* Post screen requirements. Heading,

        child: PhysicalModel(
          color: Colors.transparent,
          shadowColor: Colors.black,
          elevation: 20,
          child: Container(
            width: 350,
            height: 300,
            decoration: BoxDecoration(
                color: Color.fromRGBO(228, 205, 205, 0.75),
                borderRadius: BorderRadius.circular(15)),
            child: ListView(children: [
              Container(
                alignment: Alignment.center,
                width: 200,
                height: 50,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(161, 91, 91, 0.75)),
                child: Text(
                  'Create a Post',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 24,
                    fontFamily: 'Arial Rounded MT Bold',
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: TextFormField(
                  controller: headingController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0)),
                    labelText: 'Heading',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: TextFormField(
                  controller: descriptionController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0)),
                    labelText: 'Description',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: TextFormField(
                  controller: requirementsController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0)),
                    labelText: 'Requirements',
                  ),
                ),
              ),
              TextButton(
                  onPressed: ()  {
                    
                    },
              child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 50,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(161, 91, 91, 0.75),
                    ),
                    child: Text(
                      'Post',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Arial Rounded MT Bold',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ))
            ]),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(161, 91, 91, 0.75),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            IconButton(
              onPressed: null,
              icon: Icon(Icons.warning_rounded),
              tooltip: 'Notifications',
              iconSize: 36,
            ),
            IconButton(
              onPressed: null,
              icon: Icon(Icons.home_filled),
              tooltip: 'Home',
              iconSize: 36,
            ),
            IconButton(
              onPressed: null,
              icon: Icon(Icons.person),
              tooltip: 'Profile',
              iconSize: 36,
            ),
          ],
        ),
      ),
    );
  }
}

class UserPost extends StatelessWidget {
  UserPost({Key? key}) : super(key: key);

  TextEditingController userheader= TextEditingController();
  TextEditingController userdescription =  TextEditingController();
  TextEditingController userreference =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Post', style: TextStyle(fontFamily: 'Arial Rounded MT Bold')),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(228, 205, 205, 0.75),
        foregroundColor: Colors.black,
        shadowColor: Colors.black,
        elevation: 20,
      ),
      body: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://cdn.discordapp.com/attachments/1033448117703561326/1033448248385478738/AppBackground.png'),
              fit: BoxFit.cover),
        ),

        //* User post page page body of the person viewing the app.
        //* Post screen requirements. Heading,

        child: PhysicalModel(
          color: Colors.transparent,
          shadowColor: Colors.black,
          elevation: 20,
          child: Container(
            width: 350,
            height: 600,
            decoration: BoxDecoration(
                color: Color.fromRGBO(228, 205, 205, 0.75),
                borderRadius: BorderRadius.circular(15)),
            child:PhysicalModel(
          color: Colors.transparent,
          shadowColor: Colors.black,
          elevation: 20,
          child: Container(
            width: 350,
            height: 300,
            decoration: BoxDecoration(
                color: Color.fromRGBO(228, 205, 205, 0.75),
                borderRadius: BorderRadius.circular(15)),
            child: ListView(children: [
              Container(
                alignment: Alignment.center,
                width: 200,
                height: 50,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(161, 91, 91, 0.75)),
                child: Text(
                  'Create a Post',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 24,
                    fontFamily: 'Arial Rounded MT Bold',
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: TextFormField(
                  controller: userheader,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0)),
                    labelText: 'Heading',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: TextFormField(
                  controller: userdescription,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0)),
                    labelText: 'Description',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: TextFormField(
                  controller: userreference,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0)),
                    labelText: 'Requirements',
                  ),
                ),
              ),
              TextButton(
                  onPressed: ()  {
                    
                    },
              child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 50,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(161, 91, 91, 0.75),
                    ),
                    child: Text(
                      'Post',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Arial Rounded MT Bold',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ))
            ]),
          ),
        ),
      ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(161, 91, 91, 0.75),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            IconButton(
              onPressed: null,
              icon: Icon(Icons.warning_rounded),
              tooltip: 'Notifications',
              iconSize: 36,
            ),
            IconButton(
              onPressed: null,
              icon: Icon(Icons.home_filled),
              tooltip: 'Home',
              iconSize: 36,
            ),
            IconButton(
              onPressed: null,
              icon: Icon(Icons.person),
              tooltip: 'Profile',
              iconSize: 36,
            ),
          ],
        ),
      ),
    );
  }
}
