
import 'package:sqflite_mvp_sqlite/utils/network_util.dart';
import 'dart:async';

import '../models/user.dart';
class Restdata{
  NetworkUtil _netUtil = NetworkUtil();
  static final BASE_URL = "";
  static final LOGIN_URL = BASE_URL+"/";

  Future <User>? login(String username, String password){

    return null;
  }


}