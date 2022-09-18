import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_practical_task/screens/service/validators.dart';
import 'package:my_practical_task/screens/widgets/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _registerFormKey = GlobalKey<FormState>();
    bool _isChecked = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  late bool _success;
  late String _userEmail;

  Future<GetBar<Object>?> _register() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
      return null;
    } on FirebaseAuthException catch (ex) {
      return GetBar(backgroundColor: Colors.red,message: ex.message,duration: Duration(seconds: 2),);
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
          key: _registerFormKey,
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

                      text(
                        'Name',
                        textColor: Colors.blueAccent,
                        fontFamily: fontSemibold,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'^[ -.,]'))],
                        validator: (value) => Validator.validateName(name: value.toString()),
                        controller: _nameController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter your name"
                        ),
                      ),
                      const SizedBox(height: 16),
                      text(
                        'Email Address',
                        textColor: Colors.blueAccent,
                        fontFamily: fontSemibold,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.text,
                        inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'^[ -.,]'))],
                        validator: (value) => Validator.validateEmail(email: value.toString()),
                        decoration:  const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter your email",
                        ),
                      ),
                      const SizedBox(height: 16),
                      text(
                        ' Phone Number',
                        textColor: Colors.blueAccent,
                        fontFamily: fontRegular,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.number,
                        validator: (value) => Validator.validatePassword(password: value.toString()),
                        inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'^[ -.,]'))],
                        decoration:  const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter your phone number",

                        ),

                      ),
                      const SizedBox(height: 16),
                      text(
                        'Password',
                        textColor: Colors.blueAccent,
                        fontFamily: fontSemibold,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'^[ -.,]'))],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter valid password';
                          }
                          return null;
                        },
                        decoration:  const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter your password",
                          counterText: ""
                        ),
                        maxLength: 6,

                      ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 20),
                      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                        SizedBox(
                            height: 24.0,
                            width: 24.0,
                            child: Theme(
                              data: ThemeData(
                                  unselectedWidgetColor: Colors.red, // Your color
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
                            onPressed: () {
if(_registerFormKey.currentState!.validate()){
  _register();
}
                            },
                            color: Colors.indigoAccent[400],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0)),
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                  color: white),
                            ),
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          text('Already have an account ?'),
                          const SizedBox(width: 4),
                          GestureDetector(
                            child: text(
                              'Login',
                              textColor: colorPrimary,
                              fontFamily: fontBold,
                            ),
                            onTap: () {
                              Get.offAllNamed('/login');
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
