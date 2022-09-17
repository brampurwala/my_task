import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_practical_task/router.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  String initialRouterName = "/login";
  runApp(
    GetMaterialApp(
      defaultTransition: Transition.fade,
      title: 'Flutter Practical',
      initialRoute: initialRouterName,
      theme: ThemeData(
        scaffoldBackgroundColor:  const Color(0XFFE9E9E9),
        primaryColor: const Color(0XFF373435),
        accentColor: const Color(0XFFf76c44),
      ),
      debugShowCheckedModeBanner: false,
      getPages: AppRouter.pages,
      routingCallback: (routing) async {},
    ),
  );
}