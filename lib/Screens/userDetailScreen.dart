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
        body: Column(
          children: [
            Text(user.nama.toString()),
            Text(user.ic != '' ? user.ic.toString() : 'N/A'),
            Text(user.email ?? 'N/A'),
          ],
        ));
  }
}
