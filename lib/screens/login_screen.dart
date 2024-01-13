import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_firebase/screens/Signup_screen.dart';


import 'home_screen.dart';
import '../auth/auth_controller.dart';

final AuthController authController=Get.put(AuthController());
class login extends StatelessWidget {


  late String email;
  late String password;


  signIn()async {
    final res = await authController.signIn(email, password);
    try {

      if (res == 'success') {
        Get.to(() => const HomeScreen());
      } else {
        String title = "Alert";
        Get.defaultDialog(title: title,
            content: Text(
              res, style: const TextStyle(fontSize: 20, color: Colors.red),));
      }

    }catch(e){
      print(e);
     // AlertDialog(icon: Icon(Icons.sms_failed),title: Text("error+${e}"));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Padding(
            padding: EdgeInsets.all(45.0),
            child: Text(
              "Login ",
              style: TextStyle(
                  fontSize: 40, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              onChanged: (value){
                email=value;
              },
              decoration: const InputDecoration(
                labelText: ("Email"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              onChanged: (value){
                password=value;
              },
              decoration: const InputDecoration(
                labelText: ("Password"),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: (){
              signIn();

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
                "Sign in",
                style: TextStyle(color: Colors.white, fontSize: 30),
              )),
            ),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(27.0),
                child: Text(
                  "I don't have an account?",
                  style: TextStyle(fontSize: 19),
                ),
              ),
              TextButton(
                  onPressed: () {
                   Get.back();
                  },
                  child: const Text(
                    "Create",
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          ),
        ]),
      ),
    );
  }
}
