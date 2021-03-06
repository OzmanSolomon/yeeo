/*
 *
 *    *****   ******
 *    *   *       *
 *    *   *      *
 *    *   *     *  
 *    *****    *****
 *
 * Created on Fri May 14 2021
 *
 * Copyright (c) 2021 Osman Suliman
 * oz.solomon99@gmail.com
 */
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:yeeo/core/providers/loginProvider.dart';
import 'package:yeeo/core/utils/validator.dart';
import 'package:yeeo/views/widgets/userType.dart';

import 'signup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LoginProvider provider = Provider.of<LoginProvider>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    ResponsiveWidgets.init(
      context,
      height: 725.0,
      width: 360.0,
      allowFontScaling: true,
    );
    return ResponsiveWidgets.builder(
      height: 725.0,
      width: 360.0,
      allowFontScaling: true,
      child: Scaffold(
          body: Form(
        key: Provider.of<LoginProvider>(context, listen: false).loginFormKey,
        child: Container(
            height: height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.fill)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsetsResponsive.only(top: 150.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: 90.w,
                          height: 90.h,
                        ),
                        SizedBox(
                          width: 50.w,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsResponsive.only(
                        left: 30.0, right: 30, top: 55),
                    child: Column(
                      children: <Widget>[
                        UserTypeWidget(),
                        Row(
                          children: [
                            SizedBox(
                              width: 60.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (Provider.of<LoginProvider>(context,
                                        listen: false)
                                    .loginFormKey
                                    .currentState
                                    .validate()) {
                                  Provider.of<LoginProvider>(context,
                                          listen: false)
                                      .login(context);
                                }
                              },
                              child: Container(
                                  padding: EdgeInsetsResponsive.all(8),
                                  color: Colors.grey[400],
                                  child: Text(
                                    "Login !".tr(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 250.w,
                                  height: 45.h,
                                  padding: EdgeInsetsResponsive.all(8.0),
                                  child: TextFormField(
                                    controller: provider.emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(fontSize: 12),
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 10.0),
                                        border: new OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Colors.black)),
                                        hintText: "Email".tr(),
                                        errorStyle: TextStyle(height: 0),
                                        hintStyle: TextStyle(
                                            color: Colors.grey[400],
                                            height: 1)),
                                    validator: Validator.validateEmail,
                                  ),
                                ),
                                Container(
                                  width: 250.w,
                                  height: 45.h,
                                  padding: EdgeInsetsResponsive.all(8.0),
                                  child: TextFormField(
                                      controller: provider.passwordController,
                                      obscureText: true,
                                      style: TextStyle(fontSize: 12),
                                      decoration: InputDecoration(
                                          errorStyle: TextStyle(height: 0),
                                          border: new OutlineInputBorder(
                                              borderSide: new BorderSide(
                                                  color: Colors.black)),
                                          hintText: "Password".tr(),
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400],
                                              height: 0)),
                                      validator:
                                          Validator.validatePasswordLength),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Or".tr(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "You need something?".tr(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(10)),
                        ),
                        Text(
                          "Type it say it and you will recive a free qoutation"
                              .tr(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(10)),
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/apple.png",
                              width: 16.w,
                              height: 16.h,
                            ),
                            Text(
                              " | ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: ScreenUtil().setSp(16)),
                            ),
                            Text(
                              "Google",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: ScreenUtil().setSp(16)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
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
                              "Sign Up !".tr(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          "   copyrights 2021    yeeo.LLC  ".tr(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
      )),
    );
  }
}
