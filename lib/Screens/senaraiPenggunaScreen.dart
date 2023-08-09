import 'package:flutter/material.dart';

import '../Model/user.dart';

class SenaraiPenggunaScreen extends StatefulWidget {
  List<User> userList = [];
  SenaraiPenggunaScreen(this.userList, {super.key});

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
                  title: Text(widget.userList[index].nama.toString()),
                  subtitle: Text(widget.userList[index].ic.toString()),
                  trailing: const Icon(Icons.arrow_forward_ios),
                );
              })
          : const Center(child: Text('Tiada data')),
    );
  }
}
