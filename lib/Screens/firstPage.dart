import 'package:flutter/material.dart';
import 'package:myflutter/Screens/senaraiPenggunaScreen.dart';

import '../Model/user.dart';
import 'userDetailScreen.dart';

class FirstPage extends StatefulWidget {
  FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final String btnTitle = 'Hantar';

  TextEditingController nameController = TextEditingController();

  TextEditingController icController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  User user = User();

  List<User> userList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Borang Pendaftaran'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Text(
                    'Jumlah User: ${userList.length}',
                    style: const TextStyle(fontSize: 30),
                    textAlign: TextAlign.end,
                  ),
                ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nama',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: icController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'IC',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: ageController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Umur',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'No. Telefon',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Alamat',
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          user.nama = nameController.text;
                          user.ic = icController.text;
                          user.email = emailController.text;
                          user.phone = phoneController.text;
                          user.address = addressController.text;
                          ageController.text != ''
                              ? user.umur = int.parse(ageController.text)
                              : user.umur = 0;

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => UserDetailScreen(user)),
                          // );
                          setState(() {
                            userList.add(user);
                            nameController.clear();
                            icController.clear();
                            emailController.clear();
                            phoneController.clear();
                            addressController.clear();
                            ageController.clear();
                          });
                        },
                        child: Text(btnTitle),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            userList.clear();
                          });
                          nameController.clear();
                          icController.clear();
                          emailController.clear();
                          phoneController.clear();
                          addressController.clear();
                          ageController.clear();
                        },
                        child: const Text('Reset'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SenaraiPenggunaScreen(userList),
                            ),
                          );
                        },
                        child: const Text('Senarai'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
