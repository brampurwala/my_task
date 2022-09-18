import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_practical_task/screens/service/validators.dart';
import 'package:my_practical_task/screens/widgets/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  int _success = 1;
  String _userEmail = "";
  bool _hidePassword = true;
  final _loginFormKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  bool _isChecked = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User?user;

  Future<User?> _singIn() async {
    try {
     UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
user = userCredential.user;
    } on FirebaseAuthException catch (ex) {
      if(ex.code == "user-not-found"){
        GetBar(backgroundColor: Colors.red,message: "No email found",duration: Duration(seconds: 2));
      } else if(ex.code == "wrong-password"){
          GetBar(backgroundColor: Colors.red,message: "Wrong password",duration: Duration(seconds: 2));
        }
      return user;
    }

  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Form(
          key: _loginFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SafeArea(
            child: Stack(
              children: [
                Container(
                  height: height,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Hi, Welcome Back!",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                      const SizedBox(height: 30),
                      text(
                        'Email',
                        textColor: Colors.blueAccent,
                        fontFamily: fontSemibold,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) => Validator.validateEmail(email: value.toString()),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Please enter your email"
                        ),
                        keyboardType: TextInputType.text,
                        inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'^[ -.,]'))],

                      ),
                      const SizedBox(height: 16),
                      text(
                        'Password',
                        textColor: Colors.blueAccent,
                        fontFamily: fontSemibold,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        obscureText: _hidePassword,
                        controller: _passwordController,
                        validator: (value) => Validator.validatePassword(password: value.toString()),
                        keyboardType: TextInputType.text,
                        inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'^[ -.,]'))],
                        decoration:  InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Please enter your password",
                          suffixIconColor: Colors.black45,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _hidePassword = !_hidePassword;
                              });
                            },
                            icon: Icon(!_hidePassword ? Icons.visibility : Icons
                                .visibility_off),
                          ),
                        ),

                      ),
                      const SizedBox(height: 20),
                      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                        SizedBox(
                            height: 24.0,
                            width: 24.0,
                            child: Theme(
                              data: ThemeData(
                                  unselectedWidgetColor: const Color(0xff00C8E8) // Your color
                              ),
                              child: Checkbox(
                                  activeColor: const Color(0xff00C8E8),
                                  value: _isChecked,
                                  onChanged: (bool? value){
                                    _isChecked = value!;
                                    SharedPreferences.getInstance().then(
                                          (prefs) {
                                        prefs.setBool("remember_me", value);
                                        prefs.setString('email', _emailController.text);
                                        prefs.setString('password', _passwordController.text);
                                      },
                                    );
                                    setState(() {
                                      _isChecked = value!;
                                    });

                                  }),
                            )),
                        const SizedBox(width: 10.0),
                        const Text("Remember Me",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ))
                      ]),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: Container(
                          padding: const EdgeInsets.only(top: 3, left: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 60,
                            onPressed: ()async {

                              if(_loginFormKey.currentState!.validate()){
                                print('validate');
                                UserCredential user = await _auth.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
                                // _singIn();
                               if(user != null){
                                 Get.toNamed("/dashboard");
                               }
                              }else{
                                GetBar(
                                  message: "Email id/Password is required",
                                  backgroundColor: Colors.red,
                                  duration: const Duration(seconds: 3),
                                ).show();
                              }
                            },
                            color: Colors.indigoAccent[400],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0)),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white70),
                            ),
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          text("Don't have an account?"),
                          const SizedBox(width: 4),
                          GestureDetector(
                            child: text(
                              'SignUp',
                              textColor: colorPrimary,
                              fontFamily: fontBold,
                            ),
                            onTap: () {
                              Get.toNamed('/register');
                            },
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }

  _handleRemember(bool value) {
    _isChecked = value;
    SharedPreferences.getInstance().then(
          (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('email', _emailController.text);
        prefs.setString('password', _passwordController.text);
      },
    );
    setState(() {
      _isChecked = value;
    });
  }
}



