import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/network/dio_helper/dio_helper.dart';
import '../../../../core/network/dio_helper/end_points.dart';
import '../models/create_account_request.dart';

class CreateAccountRepo {


  static Future createAccount(
      {required CreateAccountRequestData userData}) async {

    try {
      final response = await DioHelper.postData(endPoint:EndPoints.createAccount, data: {
        "name": userData.name,
        "email": userData.email,
        "password": userData.password,
        "password_confirmation": userData.confirmPassword
      });
      if (response?.statusCode == 201) {
        return response?.data;
      } else {
        print("here");
        return null;
      }
    } catch (e ) {
      if(e is DioException){
        return e.response?.data["massage"];

      }
      return e;
    }
  }
}