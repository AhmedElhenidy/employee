import 'package:employee/presentation/ui/login_screen.dart';
import 'package:employee/presentation/ui/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder:(context,widget){
        return Directionality(textDirection: TextDirection.rtl, child: widget!);
      },
      theme: ThemeData(
      ),
      home: SplashScreen(),
    );
  }
}
