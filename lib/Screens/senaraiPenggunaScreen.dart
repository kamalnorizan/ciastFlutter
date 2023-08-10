import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/user.dart';
import '../Model/userRequestModel.dart';
import '../Network/api.dart';
import 'loginScreen.dart';

class SenaraiPenggunaScreen extends StatefulWidget {
  SenaraiPenggunaScreen({super.key});

  @override
  State<SenaraiPenggunaScreen> createState() => _SenaraiPenggunaScreenState();
}

class _SenaraiPenggunaScreenState extends State<SenaraiPenggunaScreen> {
  late List<UserModel>? userList = [];
  String? token = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checktoken();
  }

  getSenaraiPengguna() async {
    var url = '/api/users?page=1';
    var response = await Api().httpRequestWithHeader(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      UserRequestModel userRequestModel =
          UserRequestModel.fromJson(jsonDecode(response.body));
      setState(() {
        userList = userRequestModel.data!;
      });
    } else {
      // SharedPreferences localStorage = await SharedPreferences.getInstance();
      // localStorage.remove('token');
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const LoginScreen(),
      //   ),
      // );
    }
  }

  checktoken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
    if (token == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    } else {
      getSenaraiPengguna();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Senarai Pengguna'),
        actions: [
          IconButton(
            onPressed: () async {
              SharedPreferences localStorage =
                  await SharedPreferences.getInstance();

              localStorage.remove('token');
              localStorage.remove('name');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: userList!.length > 0
          ? ListView.builder(
              itemCount: userList!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(),
                  title: Text(userList![index].name.toString()),
                  subtitle: Text(userList![index].email.toString()),
                  trailing: const Icon(Icons.arrow_forward_ios),
                );
              })
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
