import 'package:book_store/core/helpers/extension.dart';
import 'package:book_store/core/widgets/custom_app_bar.dart';
import 'package:book_store/core/widgets/custom_app_button.dart';
import 'package:book_store/core/widgets/custom_text_form_field_with_title.dart';
import 'package:book_store/features/create_account/cubit/create_account_cubit.dart';
import 'package:book_store/features/create_account/data/models/create_account_request.dart';
import 'package:book_store/features/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var confirmationPassController=TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmationPassController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Log in",),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: BlocConsumer<CreateAccountCubit, CreateAccountState>(
          listener: (context, state) {
            debugPrint("State of Create Account ${state.toString()}");
            if(state is CreateAccountSuccess){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>TestScreen()));
            }else if(state is CreateAccountError){
              debugPrint("error");
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextFormFieldWithTitle(
                      validator: (v){
                        if(v==null ||v.isEmpty){
                          return " Name is required";
                        }
                      },
                      controller: nameController
                      ,title: "Name",
                      hintText: "Name",
                    ),
                    CustomTextFormFieldWithTitle(
                      validator: (value) {
                        if (value?.trim() == null || value!.trim().isEmpty) {
                          return "email is required";
                        }else if(!emailController.text.toString().isValidEmail){
                          return "please enter a valid email";
                        }
                      },
                      controller: emailController
                      ,title: "Email",
                      hintText: "example@gmail.com",
                    ),
                    CustomTextFormFieldWithTitle(
              
                      validator: (v){
                        if(v==null ||v.isEmpty){
                          return " password is required";
                        }else if(v.length<8){
                          return "password must be 8 char";
                        }
                      },
                      controller: passwordController
                      ,title: "Password",
                      hintText: "**********",
                    ),
                    CustomTextFormFieldWithTitle(
              
                      validator: (v){
                        if(v==null ||v.isEmpty){
                          return " confirmation password is required";
                        }else if(confirmationPassController.text!=passwordController.text){
                          return "confirmation password must be same as password";
                        }
                      },
                      controller: confirmationPassController
                      ,title: "Confirm password",
                      hintText: "**********",
                    ),
                    if(state is CreateAccountLoading)
                      LinearProgressIndicator(),
                    CustomAppButton(
                        onTap: () {
                          if(formKey.currentState?.validate()??false){
                            context.read<CreateAccountCubit>().createAccount(
                                userData: CreateAccountRequestData(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    confirmPassword:
                                    confirmationPassController.text));
              
                          }
                        }
                        , title: "Create Account")
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}