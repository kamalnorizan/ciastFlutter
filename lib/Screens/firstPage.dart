import 'package:flutter/material.dart';

import '../Model/user.dart';
import 'userDetailScreen.dart';

class FirstPage extends StatelessWidget {
  final String btnTitle = 'Hantar';
  TextEditingController nameController = TextEditingController();
  TextEditingController icController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  User user = User();
  FirstPage({super.key});

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
                          user.umur = ageController.text as int;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserDetailScreen(user)),
                          );
                        },
                        child: Text(btnTitle),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
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
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}