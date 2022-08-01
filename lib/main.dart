import 'package:course_app/screens/colors.dart';
import 'package:course_app/screens/details_screen.dart';
import 'package:course_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:course_app/provider/course_provider.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CourseProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
