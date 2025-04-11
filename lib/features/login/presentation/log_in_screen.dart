
import 'package:book_store/core/widgets/custom_app_bar.dart' show CustomAppBar;
import 'package:book_store/core/widgets/custom_app_button.dart';
import 'package:book_store/core/widgets/custom_text_form_field_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Log in",),
      body:Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          children: [
            CustomTextFormFieldWithTitle(title: "Email",
              hintText: "Example@gmail.com",
            ),

            CustomTextFormFieldWithTitle(title: "Password",
              hintText: "**********",
            ),

            CustomAppButton(title: "Log in")
          ],
        ),
      ),
    );
  }
}
