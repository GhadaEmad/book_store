import 'package:book_store/features/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/helpers/app_constants.dart';
import 'core/services/local/shared_prefs_helper/prefs_keys.dart';
import 'core/services/local/shared_prefs_helper/shared_prefs_helper.dart';
import 'features/bottom_nav_bar/presentation/bottom_nav_bar_screen.dart';
import 'features/create_account/cubit/create_account_cubit.dart';
import 'features/create_account/presentation/create_account_screen.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/login/presentation/log_in_screen.dart';
import 'features/onboarding/presentation/onboarding_screen.dart';
import 'features/splash/presentation/splash_screen.dart';
class BookStore extends StatelessWidget {
  const BookStore({super.key});

  @override
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
        routes: {
          "/Onboarding": (context) => OnboardingScreen(),
          "/splash": (context) => SplashScreen(),
          "/login": (context) =>
              BlocProvider(
                create: (context) => LoginCubit(),
                child: LogInScreen(),
              ),
          "/createAccount": (context) =>
              BlocProvider(
                create: (context) => CreateAccountCubit(),
                child: CreateAccountScreen(),

              ),
          "/home": (context) => HomeScreen(),
          "/bottomNav":(context)=>BottomNavBarScreen(),
        },
        initialRoute: startScreen(),
      ),
    );
  }
  String? getToken() {
    return SharedPrefsHelper.getData(PrefsKeys.tokenKey);
  }
  String startScreen() {
    if (getToken() != null) {
      return "/bottomNav";
    } else
    if (SharedPrefsHelper.getData(PrefsKeys.onBoardingIsOpened) == true) {
      return "/splash";
    } else {
      return "/Onboarding";
    }
  }
}