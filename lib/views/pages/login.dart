import 'package:flutter/material.dart';
import 'package:yeeo/core/providers/loginProvider.dart';
import 'package:yeeo/core/utils/validator.dart';
import 'package:yeeo/views/Animation/FadeAnimation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:yeeo/views/theme/appTheme.dart';

import 'signup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LoginProvider provider = Provider.of<LoginProvider>(context, listen: true);
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: Provider.of<LoginProvider>(context, listen: false).loginFormKey,
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill)),
                  child: FadeAnimation(
                      1.6,
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ))),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30, top: 25),
                child: Column(
                  children: <Widget>[
                    FadeAnimation(
                        1.8,
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[100]))),
                                child: TextFormField(
                                  controller: provider.emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: "Email",
                                      labelStyle:
                                          TextStyle(color: Colors.grey[400])),
                                  validator: Validator.validateEmail,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[100]))),
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                    controller: provider.passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        labelText: "Password",
                                        labelStyle:
                                            TextStyle(color: Colors.grey[400])),
                                    validator:
                                        Validator.validatePasswordLength),
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    FadeAnimation(
                        2,
                        GestureDetector(
                          onTap: () {
                            Provider.of<LoginProvider>(context, listen: false)
                                .login(context);
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  appTheme().primaryColor,
                                  appTheme().primaryColor,
                                ])),
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    FadeAnimation(
                        1.5,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "New User?  ",
                              style: TextStyle(color: Colors.grey),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: SignupPage()));
                                },
                                child: Text(
                                  "Register",
                                  style:
                                      TextStyle(color: appTheme().primaryColor),
                                )),
                          ],
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
