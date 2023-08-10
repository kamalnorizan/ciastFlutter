import 'package:flutter/material.dart';

import '../Model/user.dart';
import '../Model/userRequestModel.dart';

class SenaraiPenggunaScreen extends StatefulWidget {
  final List<UserModel> userList = [];
  SenaraiPenggunaScreen({super.key});

  @override
  State<SenaraiPenggunaScreen> createState() => _SenaraiPenggunaScreenState();
}

class _SenaraiPenggunaScreenState extends State<SenaraiPenggunaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Senarai Pengguna'),
      ),
      body: widget.userList.length > 0
          ? ListView.builder(
              itemCount: widget.userList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(),
                  title: Text(widget.userList[index].name.toString()),
                  subtitle: Text(widget.userList[index].email.toString()),
                  trailing: const Icon(Icons.arrow_forward_ios),
                );
              })
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
