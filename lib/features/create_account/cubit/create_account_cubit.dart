import 'package:book_store/core/services/local/shared_prefs_helper/prefs_keys.dart';
import 'package:book_store/core/services/local/shared_prefs_helper/shared_prefs_helper.dart';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/helpers/app_funcations.dart';
import '../data/models/create_account_request.dart';
import '../data/repo/creat_account_repo.dart';


part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit() : super(CreateAccountInitial());

  String? errorMessage;

  createAccount({required CreateAccountRequestData userData}) async {
    errorMessage = null;
    emit(CreateAccountLoading());
    debugPrint("Create Account Calling");
    final response=await CreateAccountRepo.createAccount(userData: userData) ;

    if (response is DioException) {
      debugPrint("dio error////");
      debugPrint(response.response?.data["errors"]["email"][0].toString());
      emit(CreateAccountError(  response.response?.data["errors"]["email"][0].toString() ?? ""));

    } else if (response["status"] == 201) {
      AppFuncations.saveUserToken(response.data["data"]["token"]);
      emit(CreateAccountSuccess());
    }


       }


  }