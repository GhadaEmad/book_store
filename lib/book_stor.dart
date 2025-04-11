
import 'package:book_store/core/helpers/app_constants.dart';
import 'package:book_store/features/onboarding/presentation/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookStor extends StatelessWidget {
  const BookStor({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
    minTextAdapt: true,
    splitScreenMode: true,
    child: MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
    fontFamily: AppConstants.appFontFamily,
    scaffoldBackgroundColor: Color(0XFFf5f5f5)
    ),
home: OnboardingScreen(),
    ),);
  }
}
