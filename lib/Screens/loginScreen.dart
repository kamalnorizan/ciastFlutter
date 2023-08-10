import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myflutter/Model/loginModel.dart';
import 'package:myflutter/Screens/firstPage.dart';
import 'package:myflutter/Screens/senaraiPenggunaScreen.dart';
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
  void initState() {
    super.initState();
    emailController.text = 'saiful123@gmail.com';
    passwordController.text = 'saiful123';
  }

  String? _validateUsername(String? value) {
    if (value == '') {
      return 'Please enter your email';
    }

    return null;
  }

  String? _validatePassword(String? value) {
    if (value == '') {
      return 'Please enter your password';
    }

    return null;
  }

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
                  validator: _validateUsername,
                  controller: emailController,
                  // initialValue: 'Developer5@gmail.com',
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: _validatePassword,
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
    if (_formKey.currentState!.validate()) {
      var data = {
        'email': emailController.text,
        'password': passwordController.text
      };

      String apiUrl = '/api/authaccount/login';

      var res = await Api().authaccount(data, apiUrl);
      var body = LoginModel.fromJson(jsonDecode(res.body));

      if (body.code == 0) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();

        localStorage.setString('token', body.data!.token.toString());
        localStorage.setString('name', body.data!.name.toString());

        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return SenaraiPenggunaScreen();
          }),
        );
      } else {
        print(body.code);
      }
    }
  }
}
