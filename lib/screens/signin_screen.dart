import 'package:flutter/material.dart';
import 'package:messageme_app/screens/chat_screen.dart';
import 'package:messageme_app/widgets/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messageme_app/widgets/my_text.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInScreen extends StatefulWidget {
  static const String screenRoute = 'signin_screen';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showspinner = false;
  final formkey = GlobalKey<FormState>();
  final scaffoidkey = GlobalKey<ScaffoldState>();
  TextEditingController _controlleremail = TextEditingController();
  TextEditingController _controllerpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoidkey,
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showspinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 180,
                  child: Image.asset('images/proj.png'),
                ),
                SizedBox(height: 50),
                RoundedInputField(
                    hintText: 'Enter your Email',
                    controller: _controlleremail,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Enter correct email ';
                      } else {
                        return null;
                      }
                    }),
                SizedBox(height: 8),
                RoundedInputField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  hintText: 'Enter your password',
                  controller: _controllerpass,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[+]*[)}{0,1}[0-9]{1,4}[)}{0,1}[-\s\./0-9]+$')
                            .hasMatch(value)) {
                      return 'Enter correct password ';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10),
                MyButton(
                  color: Colors.red[900]!,
                  title: 'Sign in',
                  onPressed: () async {
                    setState(() {
                      showspinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: _controlleremail.text,
                          password: _controllerpass.text);
                      // ignore: unnecessary_null_comparison
                      if (formkey.currentState!.validate()) {
                        Navigator.pushNamed(context, ChatScreen.screenRoute);
                        setState(() {
                          showspinner = false;
                        });
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('e'),
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
