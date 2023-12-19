import 'package:flutter/material.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Text(
              "Login ",
              style: TextStyle(
                  fontSize: 40, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: ("Email"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: ("Password"),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
                child: Text(
              "Sign in",
              style: TextStyle(color: Colors.white, fontSize: 30),
            )),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(27.0),
                child: Text(
                  "I don't have an account?",
                  style: TextStyle(fontSize: 19),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
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
