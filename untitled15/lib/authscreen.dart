import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled15/homescreen.dart';



class MyApp02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthScreen(),
    );
  }
}

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login and Register'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginForm(),
            SizedBox(height: 20),
            RegisterForm(),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void signUp() async {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: "abc1@gmail.com", password: "12345678");
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Login', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(labelText: 'Email'),
        ),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () async {
            UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);

            if(userCredential !=null){

              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: "",)));
            }


            // Add your login logic here
            // Example: validate credentials and navigate to the home screen
          },
          child: Text('Login'),
        ),
      ],
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Register', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(labelText: 'Email'),
        ),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            // Add your registration logic here
            // Example: create a new user account and navigate to the home screen
          },
          child: Text('Register'),
        ),
      ],
    );
  }
}
