import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:librarysystem/model/user_details.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';


class LoginController with ChangeNotifier{
  //object

  final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;

  UserDetails? userDetails;

  // Function for Google Login

  googleLogin() async{
    this.googleSignInAccount = await _googleSignIn.signIn();

    //Inserting values to user details model

    this.userDetails = UserDetails(

      displayName: this.googleSignInAccount!.displayName,
      email : this.googleSignInAccount!.email,
      photoURL: this.googleSignInAccount!.photoUrl



    );

    //call
    notifyListeners();

  }

  // Function for Facebook Login

  facebooklogin() async {
    var result = await FacebookAuth.i.login(
        permissions: [
          "public_profile", "email",
        ]
    );
    //Check the Status for Login
    if (result.status == LoginStatus.success) {
      final requestData = await FacebookAuth.i.getUserData(
          fields: "email,name.picture"
      );
      this.userDetails = new UserDetails(
          displayName: requestData["name"],
          email: requestData["email"],
          photoURL: requestData["picture"]["data"]["url"] ?? ""

      );
      notifyListeners();
    }
  }

  // Logout

  logout() async {
    // Empty the value after Logout
    this.googleSignInAccount = await _googleSignIn.signOut();
    await FacebookAuth.i.logOut();

    userDetails = null;

    //call

    notifyListeners();

  }
}