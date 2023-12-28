import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get_state_manager/get_state_manager.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> registration(
      String name, String email, String password) async {
    String res = "eror";
    try {
      if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email:email,
            password: password);

         return "Succes";

      } else {
       return res = "Formka Buuxi";
      }
    } catch (e) {
      print(e);
    }
    return res;


  }
  signIn(String email,String password)async{
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
       return "success";
      }else{
        return "eror";
      }
    }catch(e) {
      return e;
    }

    }
  }

