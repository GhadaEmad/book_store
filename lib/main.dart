
import 'package:book_store/book_stor.dart';
import 'package:book_store/core/services/local/shared_prefs_helper/shared_prefs_helper.dart';
import 'package:flutter/material.dart';

import 'core/network/dio_helper/dio_helper.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
   await SharedPrefsHelper.init();
  DioHelper.init();
  runApp(BookStore());
}