import 'dart:developer';

import 'package:employee/app/app_colors.dart';
import 'package:employee/app/app_font_sizes.dart';
import 'package:employee/app/app_padding.dart';
import 'package:employee/app/app_strings.dart';
import 'package:employee/presentation/widgets/global_alert.dart';
import 'package:flutter/material.dart';

import '../../data/firebase_services/create_complain_suggestion.dart';
import '../../domain/model/complain_sugget_model.dart';

class SuggestScreen extends StatefulWidget {
  const SuggestScreen({Key? key}) : super(key: key);

  @override
  State<SuggestScreen> createState() => _SuggestScreenState();
}

class _SuggestScreenState extends State<SuggestScreen> {
  final TextEditingController _suggestNameController = TextEditingController();
  final TextEditingController _suggestTextController = TextEditingController();
  final TextEditingController _suggestAffectedTerminalsController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.PRIMARY_COLOR,
        centerTitle: true,
        title: const Text(
          AppStrings.suggest,
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
            key:formKey ,
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

                const SizedBox(height: 19,),
                const Text(
                  AppStrings.suggestName,
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
                        return "برجاء ادخل اسم المفترح - المبادرة" ;
                      }
                      else
                        {
                          return null ;
                        }
                    },
                    controller: _suggestNameController,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.PRIMARY_COLOR)
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.PRIMARY_COLOR)
                        ),
                        hintText: AppStrings.suggestName,
                        hintStyle: TextStyle(
                            color: AppColors.HINT_COLOR,
                            fontSize: AppFontSizes.s14
                        )
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                const Text(
                  AppStrings.suggestDesc,
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
                        return "برجاء ادخل محتوى المفترح - المبادرة" ;
                      }
                      else
                      {
                        return null ;
                      }
                    },
                    maxLines: 8,
                    minLines: 1,
                    controller: _suggestTextController,
                    obscureText: false,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.PRIMARY_COLOR)
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.PRIMARY_COLOR)
                        ),
                        hintText: AppStrings.suggestDesc,
                        hintStyle: TextStyle(
                            color: AppColors.HINT_COLOR,
                            fontSize: AppFontSizes.s14
                        )
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                const Text(
                  AppStrings.affectedTerminals,
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
                    maxLines: 8,
                    minLines: 1,
                    controller: _suggestAffectedTerminalsController,
                    obscureText: false,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.PRIMARY_COLOR)
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.PRIMARY_COLOR)
                        ),
                        hintText: AppStrings.affectedTerminals,
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
                              title:_suggestNameController.text,
                              desc: _suggestTextController.text,
                              affectedTerminals: _suggestAffectedTerminalsController.text,
                              type: "مقترح - مبادرة"
                          ),
                          onSuccess: (){
                            showSuccessDialog(context, "تم إرسال طلبك بنجاح");
                          },
                          onError: (e){
                            showMyDialog(context, e.toString());
                          });
                    }
                   // BlocProvider.of<LoginCubit>(context).login(
                     //   UserSendModel(code:_codeController.text ,password:_passwordController.text ));
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
