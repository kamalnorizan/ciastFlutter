import 'package:flutter/material.dart';

import '../Model/user.dart';

class UserDetailScreen extends StatelessWidget {
  User user = User();
  UserDetailScreen(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Maklumat Pengguna'),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 10,
              ),
              const CircleAvatar(
                radius: 60,
              ),
              Text(
                user.nama.toString(),
                style: TextStyle(fontSize: 30),
              ),
              Text(
                user.ic != '' ? user.ic.toString() : 'N/A',
                style: TextStyle(fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.email),
                  const SizedBox(width: 5),
                  Text(
                    user.email ?? 'N/A',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.phone_android),
                  const SizedBox(width: 5),
                  Text(
                    user.phone != '' ? user.phone.toString() : 'N/A',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
