import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user_api/RandomUser/Provider/User_provider.dart';
import 'package:random_user_api/RandomUser/Splash/Splash_screen.dart';
import 'package:random_user_api/RandomUser/View/Home_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder:(context, orientation, deviceType) =>  MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserProvider(),),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: "splash",
            routes: {
              "/":(context) => Home_screen(),
              "splash":(context) => Splash_screen(),
            },
          ),
      ),
    ),
  );
}
