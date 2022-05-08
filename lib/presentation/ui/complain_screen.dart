import 'dart:developer';
import 'package:employee/app/app_colors.dart';
import 'package:employee/app/app_font_sizes.dart';
import 'package:employee/app/app_padding.dart';
import 'package:employee/app/app_strings.dart';
import 'package:employee/presentation/widgets/global_alert.dart';
import 'package:flutter/material.dart';

import '../../data/firebase_services/create_complain_suggestion.dart';
import '../../domain/model/complain_sugget_model.dart';

class ComplainScreen extends StatefulWidget {
  const ComplainScreen({Key? key}) : super(key: key);

  @override
  State<ComplainScreen> createState() => _ComplainScreenState();
}

class _ComplainScreenState extends State<ComplainScreen> {
  final TextEditingController _complainTitleController = TextEditingController();
  final TextEditingController _complainTextController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String radioGroup = AppStrings.firstTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.PRIMARY_COLOR,
        centerTitle: true,
        title: const Text(
          AppStrings.complain,
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
                // Center(
                //   child: SvgPicture.asset(AppAssets.appLogo,color: AppColors.PRIMARY_COLOR,width: 80,height: 80,),
                // ),
                // const Text(
                //   AppStrings.welcome,
                //   style: TextStyle(
                //     fontSize: AppFontSizes.s28,
                //     color: AppColors.BLACK,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                const Text(
                  AppStrings.complainStatus,
                  style: TextStyle(
                    fontSize: AppFontSizes.s20,
                    color: AppColors.BLACK,
                  ),
                ),
                ListTile(
                  onTap: (){
                    setState(() {
                      radioGroup = AppStrings.firstTime;
                    });
                  },
                  title: const Text(AppStrings.firstTime,
                    style: TextStyle(
                        fontSize: AppFontSizes.s18
                    ),
                  ),
                  leading: Radio<String>(
                    activeColor: AppColors.PRIMARY_COLOR,
                    value: AppStrings.firstTime,
                    groupValue: radioGroup,
                    onChanged: (value) {
                      setState(() {
                        radioGroup = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  onTap: (){
                    setState(() {
                      radioGroup = AppStrings.notFirstTime;
                    });
                  },
                  title: const Text(AppStrings.notFirstTime,
                    style: TextStyle(
                      fontSize: AppFontSizes.s18
                    ),
                  ),
                  leading:  Radio<String>(
                    activeColor: AppColors.PRIMARY_COLOR,
                    value: AppStrings.notFirstTime,
                    groupValue: radioGroup,
                    onChanged: (value) {
                      setState(() {
                        radioGroup = value!;
                      });
                    },
                  ),
                ),

                 const SizedBox(height: 19,),
                const Text(
                  AppStrings.complainTitle,
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
                        return "برجاء ادخل عنوان الشكوي" ;
                      }
                      else
                      {
                        return null ;
                      }
                    },
                    controller: _complainTitleController,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.PRIMARY_COLOR)
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.PRIMARY_COLOR)
                        ),
                        hintText: AppStrings.complainTitle,
                        hintStyle: TextStyle(
                            color: AppColors.HINT_COLOR,
                            fontSize: AppFontSizes.s14
                        )
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                const Text(
                  AppStrings.complainDesc,
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
                        return "برجاء ادخل موضوع الشكوي" ;
                      }
                      else
                      {
                        return null ;
                      }
                    },
                    maxLines: 8,
                    minLines: 1,
                    controller: _complainTextController,
                    obscureText: false,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.PRIMARY_COLOR)
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.PRIMARY_COLOR)
                        ),
                        hintText: AppStrings.complainDesc,
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
                      log("true");
                      FirebaseCreateComplainSuggestion.createComplainSuggestion(
                          ComplainSuggestModel(
                            firstTime: radioGroup,
                            title: _complainTitleController.text,
                            desc: _complainTextController.text,
                            type: "شكوى"
                          ),
                          onSuccess: (){
                            showMyDialog(context, "message");
                          },
                          onError: (e){
                            showMyDialog(context, e.toString());
                          });
                    }
                  //   BlocProvider.of<LoginCubit>(context).login(
                  //       UserSendModel(code:_codeController.text ,password:_passwordController.text ));
                  },
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.PRIMARY_COLOR
                    ),
                    child: const Center(
                      child: Text(
                        AppStrings.send,
                        style: TextStyle(
                          fontSize: AppFontSizes.s22,
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
