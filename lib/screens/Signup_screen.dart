import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:login_firebase/auth/auth_controller.dart';
import 'package:login_firebase/screens/login_screen.dart';

// import 'package:firebase_flutter/login_screen.dart';
final AuthController authController=Get.put(AuthController());
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => SignupState();
}

late String name;
late String email;
late String password;


signup()async {
  String res = await authController.registration(name,email, password);
  if (res == 'Succes') {
    String title = "Alert";
    Get.defaultDialog(title: title,content: Text(res,style: TextStyle(fontSize: 20,color: Colors.green)));

  }else{
    String title = "Alert";
    Get.defaultDialog(title: title,content: Text(res,style: TextStyle(fontSize: 20,color: Colors.red),));
  }
}

class SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Center(
            child: Text(
              "Sign Up",
              style: TextStyle(
                  fontSize: 40, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              onChanged: (value) {
                name = value;
              },
              decoration: const InputDecoration(
                labelText: ("Name"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              onChanged: (value) {
                email = value;
              },
              decoration: const InputDecoration(
                labelText: ("Email"),
              ),
            ),
          ),
         Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              onChanged: (value) {
                password = value;
              },
              obscureText: true,
              decoration: const InputDecoration(
                labelText: ("Password"),
              ),
            ),
          ),
         const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              signup();
            },
            child: Container(
              width: MediaQuery.of(context).size.width - 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                  child: Text(
                "Sign up",
                style: TextStyle(color: Colors.white, fontSize: 30),
              )),
            ),
          ),
          Row(
            children: [
              const Padding (
                padding: EdgeInsets.all(27.0),
                child: Text(
                  "already have an account?",
                  style: TextStyle(fontSize: 19),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Get.to(()=> login());

                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          ),
        ]),
      ),
    );
  }
}
