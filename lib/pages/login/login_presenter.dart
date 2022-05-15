


 import 'package:sqflite_mvp_sqlite/data/restdata.dart';

import '../../models/user.dart';

abstract class LoginpageContract  {

  void onLoginSucess(User user);
  void onLoginError(String error);
}

class LoginPagePresenter{

  LoginpageContract  _view;
  Restdata api = Restdata();
  LoginPagePresenter(this._view);
  doLogin(String username , String password)
  {
    api
        .login(username, password)
        ?.then((user) => _view.onLoginSucess (user))
        .catchError((onError) => _view.onLoginError(onError));

  }

}