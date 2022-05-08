import 'package:employee/app/app_colors.dart';
import 'package:employee/app/app_font_sizes.dart';
import 'package:employee/app/app_helpers.dart';
import 'package:employee/app/app_padding.dart';
import 'package:employee/app/app_strings.dart';
import 'package:employee/presentation/ui/complain_screen.dart';
import 'package:employee/presentation/ui/suggest_screen.dart';
import 'package:flutter/material.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({Key? key}) : super(key: key);

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.PRIMARY_COLOR,
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
      body: Padding(
        padding: AppPadding.PAGE_EDGES_PADDING_HORIZONTAL,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 56,),

            InkWell(
              onTap: () {
                navigateTo(context, SuggestScreen());
              //   BlocProvider.of<LoginCubit>(context).login(
              //       UserSendModel(code:_codeController.text ,password:_passwordController.text ));
              },
              child: Container(
                height: 105,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.PRIMARY_COLOR
                ),
                child: const Center(
                  child: Text(
                    AppStrings.suggest,
                    style: TextStyle(
                      fontSize: AppFontSizes.s22,
                      color: AppColors.WHITE,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32,),
            InkWell(
              onTap: () {
                navigateTo(context, ComplainScreen());
                // BlocProvider.of<LoginCubit>(context).login(
                //     UserSendModel(code:_codeController.text ,password:_passwordController.text ));
              },
              child: Container(
                height: 105,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.PRIMARY_COLOR
                ),
                child: const Center(
                  child: Text(
                    AppStrings.complain,
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
    );
  }
}
