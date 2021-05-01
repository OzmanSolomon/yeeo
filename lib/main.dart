import 'package:flutter/material.dart';
import 'package:yeeo/views/pages/login.dart';
import 'package:yeeo/views/theme/appTheme.dart';
import 'package:provider/provider.dart';
import 'core/providers/homeProvider.dart';
import 'core/providers/loginProvider.dart';
import 'core/providers/signupProvider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: MaterialApp(
        theme: appTheme(),
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    ));
