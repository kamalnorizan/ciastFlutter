import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myflutter/Model/loginModel.dart';
import 'package:myflutter/Screens/firstPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Network/api.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 80,
          ),
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png'),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          login();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white),
                        child: const Text('Login'),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Sign Up'),
                      ),
                    )
                  ],
                ),
                TextButton(
                    onPressed: () {}, child: const Text('Forgot Password?'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  login() async {
    var data = {
      'email': emailController.text,
      'password': passwordController.text
    };

    String apiUrl = '/api/authaccount/login';

    var res = await Api().authaccount(data, apiUrl);
    var body = LoginModel.fromJson(jsonDecode(res.body));

    if (body.code == 0) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();

      localStorage.setString('token', json.encode(body.data!.token));
      localStorage.setString('name', json.encode(body.data!.name));
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return FirstPage();
        }),
      );
    } else {
      print(body.code);
    }
  }
}
