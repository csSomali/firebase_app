import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:login_firebase/auth/auth_controller.dart';
import 'package:login_firebase/login_screen.dart';

// import 'package:firebase_flutter/login_screen.dart';
final AuthController authController=Get.put(AuthController());
class Signup extends StatefulWidget {
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
    Get.defaultDialog(title: "alert",content: Text(res,style: TextStyle(fontSize: 20,color: Colors.green)));
    print(res);
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
          Center(
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
              decoration: InputDecoration(
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
              decoration: InputDecoration(
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
              decoration: InputDecoration(
                labelText: ("Password"),
              ),
            ),
          ),
          SizedBox(
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
              child: Center(
                  child: Text(
                "Sign up",
                style: TextStyle(color: Colors.white, fontSize: 30),
              )),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(27.0),
                child: Text(
                  "already have an account?",
                  style: TextStyle(fontSize: 19),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Get.to(()=>const login());

                  },
                  child: Text(
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
