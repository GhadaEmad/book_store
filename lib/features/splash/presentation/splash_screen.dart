
import 'package:book_store/core/helpers/app_images.dart';
import 'package:book_store/core/helpers/spacing.dart';
import 'package:book_store/core/widgets/custom_app_button.dart';
import 'package:book_store/features/create_account/presentation/create_account_screen.dart';
import 'package:book_store/features/login/cubit/login_cubit.dart';
import 'package:book_store/features/login/presentation/log_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover
            ,image: Image.asset(AppImages.splashImage).image,
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),

          color: Colors.black.withOpacity(.5),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.appLogo),
              verticalSpace(80),
              CustomAppButton(
                title: "Login",
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BlocProvider(
  create: (context) => LoginCubit(),
  child: LogInScreen(),
)));
                },
              ),
              verticalSpace(16),
              CustomAppButton(
                title: "Create Account",
                backgroundColor: Colors.white,
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAccountScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}