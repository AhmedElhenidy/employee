import 'dart:developer';

import 'package:employee/app/app_assets.dart';
import 'package:employee/app/app_colors.dart';
import 'package:employee/app/app_font_sizes.dart';
import 'package:employee/app/app_helpers.dart';
import 'package:employee/app/app_padding.dart';
import 'package:employee/app/app_strings.dart';
import 'package:employee/data/firebase_services/firebase_auth.dart';
import 'package:employee/presentation/ui/select_screen.dart';
import 'package:employee/presentation/widgets/global_alert.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:AppColors.PRIMARY_COLOR,
        centerTitle: true,
        title: const Text(
          AppStrings.appName,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: ListView(
        padding: AppPadding.PAGE_EDGES_PADDING_HORIZONTAL,
        children: [
          Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32,),
                Center(
                  child: Image.asset(AppAssets.splash,width: 140,height: 140,fit: BoxFit.fill,),
                ),
                const SizedBox(height: 16,),
                // const Text(
                //   AppStrings.welcome,
                //   style: TextStyle(
                //     fontSize: AppFontSizes.s28,
                //     color: AppColors.BLACK,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // const SizedBox(height: 19,),
                const Text(
                  AppStrings.userName,
                  style: TextStyle(
                    fontSize: AppFontSizes.s20,
                    color: AppColors.BLACK,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: AppColors.TEXTFIELD_BACKGROUND
                  ),
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return"أدخل بريد إالكترونى صحيح";
                      }
                      else{
                        return null ;
                      }
                    },
                    controller: _codeController,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.PRIMARY_COLOR)
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.PRIMARY_COLOR)
                        ),                          hintText: AppStrings.enterIdentityNumber,
                        hintStyle: TextStyle(
                            color: AppColors.HINT_COLOR,
                            fontSize: AppFontSizes.s14
                        )
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                const Text(
                  AppStrings.password,
                  style: TextStyle(
                    fontSize: AppFontSizes.s20,
                    color: AppColors.BLACK,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: AppColors.TEXTFIELD_BACKGROUND
                  ),
                  child:  TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return"أدخل الرقم السري";
                      }
                      else{
                        return null ;
                      }
                    },
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.PRIMARY_COLOR)
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.PRIMARY_COLOR)
                        ),
                        hintText: AppStrings.enterPassword,
                        hintStyle: TextStyle(
                            color: AppColors.HINT_COLOR,
                            fontSize: AppFontSizes.s14
                        )
                    ),
                  ),
                ),
                const SizedBox(height: 43,),
                // state is LoginLoading
                //     ?
                // Loading()
                //     :
                InkWell(
                  onTap: () {
                    if(formKey.currentState!.validate()){
                      FirebaseAuthService.login(
                        _codeController.text,
                        _passwordController.text,
                            (){
                            log("loggedIN");
                            navigateTo(context, SelectScreen(),removeAll: true);
                            },
                            (error) {
                          showMyDialog(context, error);
                            },
                      );
                    }
                    //navigateTo(context, SelectScreen());
                    // BlocProvider.of<LoginCubit>(context).login(
                    //     UserSendModel(code:_codeController.text ,password:_passwordController.text ));
                  },
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.PRIMARY_COLOR
                    ),
                    child: const Center(
                      child: Text(
                        AppStrings.login,
                        style: TextStyle(
                          fontSize: AppFontSizes.s16,
                          color: AppColors.WHITE,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}