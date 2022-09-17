import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_practical_task/screens/widgets/theme.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  User? user = FirebaseAuth.instance.currentUser;
  static Future<GetBar<Object>?> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return null;
    } on FirebaseAuthException catch (ex) {
      return GetBar(backgroundColor: Colors.red,message: ex.message,duration: Duration(seconds: 2),);
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 50
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Color(0XFF0231C80d),
                  child:
                  Image.asset("assets/images/img_1.png"),
                  ),

              ],
            ),
            SizedBox(height: 19),
            Text(user!.displayName.toString(),style: TextStyle(fontSize: 23,color: Color(0xff0231c8),fontWeight: FontWeight.w700),),
            SizedBox(height: 19),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 15, 20, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("Email",style: TextStyle(fontSize: 18,color: Color(0xff000000),fontWeight: FontWeight.w500)),
                Text(user!.email.toString(),style: TextStyle(fontSize: 15,color: Color(0xff0231c8),fontWeight: FontWeight.w400)),
              ],),
            ),
            Divider(thickness: 1),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 15, 20, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Phone No.",style: TextStyle(fontSize: 18,color: Color(0xff000000),fontWeight: FontWeight.w500)),
                  Text(user!.phoneNumber.toString(),style: TextStyle(fontSize: 15,color: Color(0xff0231c8),fontWeight: FontWeight.w400)),
                ],),
            ),
            Divider(thickness: 1),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 5, 20, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Log out",style: TextStyle(fontSize: 18,color: Color(0xff000000),fontWeight: FontWeight.w500)),
                  IconButton(
                    iconSize: 19,
                    icon: const Icon(
                      Icons.login,
                      color: Color(0xff0231c8),
                    ),
                    onPressed: () {

                      signOut();
                    },
                  ),
                ],),
            ),
            Divider(thickness: 1),
          ],
        ),
      )

    );
  }
}
