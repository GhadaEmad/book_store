

import 'package:book_store/core/helpers/app_funcations.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginRepo loginRepo=LoginRepo();

  login({required String email,required String pass})async{
    emit(LoginLoading());
    final response=await loginRepo.login(email: email, pass: pass);
    if(response is DioException){
      emit(LoginError(response.response?.data["message"]));

    }else if(response is Response){
      if(response.statusCode==200){
        debugPrint(response.data.toString());
       AppFuncations.saveUserToken(response.data["data"]["token"]);
        emit(LoginSuccess());
      }else{
        emit(LoginError(response.data["message"]));
      }
    }
  }

}