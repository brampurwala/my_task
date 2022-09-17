import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_practical_task/screens/user_details.dart';
import 'package:my_practical_task/screens/widgets/theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String txt = "";
  User? user = FirebaseAuth.instance.currentUser;



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    print('userData ${user}');
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child:  Stack(
          children: [
            Container(
              height: height,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  <Widget>[
                  SizedBox(height: 30),
                  Text("immence",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.purpleAccent),),
                  SizedBox(height: 35),
                  Text("Users",style: TextStyle(fontSize: 30,fontWeight: FontWeight.normal,color: Colors.black),),
                  SizedBox(height: 40),
                Card(
                  elevation: 5,
                  child: ListTile(
                    leading: Text(user!.email!.substring(0,1).toUpperCase(),style: TextStyle(fontSize: 30,),),
                    title:  Text(
                      user!.displayName.toString(),
                      textScaleFactor: 1.5,
                      style: TextStyle(color: Colors.black,),
                    ),
                    trailing:  const Icon(Icons.radio_button_checked),
                    subtitle:  Text(user!.email.toString(),style: TextStyle(color: Colors.grey,),),
                    selected: true,
                    onTap: () {
                      Get.toNamed("/user-details");
                    },
                  ),
                ),
              ]

              ),
            ),
          ],
        ),
      ),
    );
  }
}
