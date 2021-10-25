import 'package:flutter/material.dart';
import 'package:librarysystem/controllers/login_controller.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Library System"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),

      //body of UI

      body: loginUI(),
      backgroundColor: Colors.yellow[200],



    );
  }

  //Creating a function LoginUI

  loginUI(){
    //loggedInUI
    //login Controllers
    return Consumer<LoginController>(
      builder: (context,model,child){

        //If we are already LoggedIn
        if(model.userDetails != null){
          return Center(
            child: loggedInUI(model),
          );
        }

        else{
          return loginControllers(context);
        }
      }
    );
  }

  loggedInUI(LoginController model){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center ,
      crossAxisAlignment: CrossAxisAlignment.center,


      //UI will have 4 Children

      children: [
        CircleAvatar(
          backgroundImage: Image.network(model.userDetails!.photoURL ?? "").image,
          radius: 50,
        ),
        Text(model.userDetails!.displayName ?? ""),
        Text(model.userDetails!.email ?? ""),

        //LogOut

        ActionChip(
            avatar: Icon(Icons.logout),
            label: Text("Logout"),
            onPressed: (){
              Provider.of<LoginController>(context,listen: false).logout();

            }
        )
      ],
    );
  }
  loginControllers(BuildContext context){
    return Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           GestureDetector(
             child: Image.asset("assets/images/google.png",
               width: 240,),
             onTap: (){
               Provider.of<LoginController>(context,listen: false).googleLogin();
             },
           ),
           SizedBox(height: 25 ),
           GestureDetector(
             child: Image.asset("assets/images/fb.png",
               width: 240,),
             onTap: (){
               Provider.of<LoginController>(context,listen: false).facebooklogin();
             },
           ),
         ],
       )
    );
  }
}
