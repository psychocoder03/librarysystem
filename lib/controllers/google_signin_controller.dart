import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class GoogleSignInController with ChangeNotifier{

  //object
  var _googleSignIn= GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;

  // Function for Login
  login() async
  {
    googleSignInAccount = await _googleSignIn.signIn();

    //call

    notifyListeners();
  }

  //Function for Logout
  logout() async
  {
    //Emptying the values after logout
    googleSignInAccount = await _googleSignIn.signOut();

    //call
    notifyListeners();

  }
}