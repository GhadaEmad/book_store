import 'package:book_store/core/widgets/custom_app_bar.dart' show CustomAppBar;
import 'package:book_store/core/widgets/custom_app_button.dart';
import 'package:book_store/core/widgets/custom_text_form_field_with_title.dart';
import 'package:book_store/features/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Log in",),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            // TODO: implement listener
        if (state is LoginLoading) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.transparent,
            content: Center(child: CircularProgressIndicator()),
          ));
    } else if (state is LoginSuccess) {
    Navigator.pop(context);
    } else if (state is LoginError) {
    Navigator.pop(context);
    showDialog(
    context: context,
    builder: (context) => AlertDialog(
    content: Text(state.errorMessage),
    ));
    }

          },
          child: Column(
            children: [
              CustomTextFormFieldWithTitle(title: "Email",
                hintText: "Example@gmail.com",
              ),

              CustomTextFormFieldWithTitle(title: "Password",
                hintText: "**********",
              ),

              CustomAppButton(onTap: () {
                context.read<LoginCubit>().login(
                    email: emailController.text,
                    pass: passController.text);
              },
              title: "Log in")
            ],
          ),
        ),
      ),
    );
  }
}
