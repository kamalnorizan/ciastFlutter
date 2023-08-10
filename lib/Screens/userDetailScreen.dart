import 'package:flutter/material.dart';

import '../Model/user.dart';
import '../Model/userRequestModel.dart';

class UserDetailScreen extends StatelessWidget {
  UserModel user = UserModel();

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
              CircleAvatar(
                backgroundImage: NetworkImage(user.profilepicture.toString()),
                radius: 60,
              ),
              Text(
                user.name.toString(),
                style: const TextStyle(fontSize: 30),
              ),
              Text(
                user.email != '' ? user.email.toString() : 'N/A',
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                user.location.toString(),
                style: const TextStyle(fontSize: 30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.email),
                  const SizedBox(width: 5),
                  Text(
                    user.email ?? 'N/A',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     const Icon(Icons.phone_android),
              //     const SizedBox(width: 5),
              //     Text(
              //       user.phone != '' ? user.phone.toString() : 'N/A',
              //       style: const TextStyle(fontSize: 20),
              //     ),
              //   ],
              // ),
              // Text(
              //   user.address.toString(),
              //   style: const TextStyle(fontSize: 30),
              // ),
            ],
          ),
        ));
  }
}
