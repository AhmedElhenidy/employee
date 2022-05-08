import 'dart:async';
import 'dart:developer';
import 'package:employee/app/app_assets.dart';
import 'package:employee/app/app_colors.dart';
import 'package:employee/app/app_helpers.dart';
import 'package:employee/presentation/ui/login_screen.dart';
import 'package:employee/presentation/ui/select_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
   SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? token ;
  Timer? _timer ;
  @override
  void initState() {
    super.initState();
  }
  checkUser()async{
   if( FirebaseAuth.instance.currentUser ==null){
     navigateTo(context,const LoginScreen() , removeAll: true);
   }
   else{
     navigateTo(context,const SelectScreen() , removeAll: true);
   }

    // token = await getToken();
    // if (token == null){
    //   navigateTo(context,const LoginScreen() , removeAll: true);
    // }else{
    //   uid = await getUid() ;
    //   log(token??"");
    //   navigateTo(context, const HomeScreen() , removeAll: true);
    // }
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _timer = Timer(const Duration(seconds: 2 ) , checkUser);
    return  Container(
      color: AppColors.WHITE,
      child: Center(
        child: Image.asset(AppAssets.splash,width: 180,height: 180,),
      ),
    );
  }
}
