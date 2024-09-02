 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:movies_app/home/home.dart';

void main()async
 {
   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
   FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
   await Future.delayed(const Duration(seconds: 1));
   await Future.delayed(const Duration(seconds: 1));
   await Future.delayed(const Duration(seconds: 1));
   await Future.delayed(const Duration(seconds: 1));
   await Future.delayed(const Duration(seconds: 1));
   FlutterNativeSplash.remove();
   runApp(MyApp());

 }





 class MyApp extends StatelessWidget {
   const MyApp({super.key});

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       initialRoute: HomeScreen.routeName,
       routes: {
         HomeScreen.routeName: (context) => HomeScreen(),

       },
     );
   }
 }
 