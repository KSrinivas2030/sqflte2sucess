import 'package:flutter/material.dart';
import 'package:sqflite_mvp_sqlite/data/database_helper.dart';
import 'package:sqflite_mvp_sqlite/models/user.dart';
import 'package:sqflite_mvp_sqlite/pages/login/login_presenter.dart';
class Loginpage extends StatefulWidget {
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> implements
LoginpageContract{
  BuildContext ?_ctx;
  bool ?_isLoading;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey= GlobalKey<ScaffoldState>();
  late String _username, _password;
  LoginPagePresenter ?_presenter;
  _LoginpageState(){

    _presenter= LoginPagePresenter(this);
  }
  void _submit(){
    final form = formKey.currentState;
    if(form!.validate()){
      setState(() {
        _isLoading=true;
        form.save();
        _presenter!.doLogin(_username, _password);
      });
    }
  }
  void _showSnackBar(String text){
    scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(text)));
  }
  @override
  Widget build(BuildContext context) {
    _ctx=context;
    var loginBtn = RaisedButton(
        onPressed:_submit,
        child: Text('Login'),
      color: Colors.green,
    );
  var loginForm =  Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text("sqfflite App Login",textScaleFactor: 3.0,),
      Form(
        key:formKey,
        child: Column(
          children:<Widget> [
            Padding(padding: EdgeInsets.all(14.0),
            child: TextFormField(
              onSaved: (val)=> _username=val!,
              decoration: InputDecoration(
                labelText:"Username",
              ),
            ),
            ),
            Padding(padding: EdgeInsets.all(14.0),
              child: TextFormField(
                onSaved: (val)=> _username=val!,
                decoration: InputDecoration(
                  labelText:"Password",
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
  return Scaffold(
    appBar: AppBar(
      title: Text('LoginPage',style:TextStyle(fontWeight:FontWeight.bold,) ,),
    ),
    key: scaffoldKey,
    body: Container(
      child: Center(
        child: loginForm,
      ),
    ),
  );

  @override
  void onLoginError(String error) {
    // TODO: implement onLoginError
  }

  @override
  void onLoginSucess(User user) {
    // TODO: implement onLoginSucess
  }
}

  @override
  void onLoginError(String error) {
    // TODO: implement onLoginError
    _showSnackBar(error);
    setState(() {
      _isLoading=false;

    });

  }

  @override
  void onLoginSucess(User user) async {
    // TODO: implement onLoginSucess
    _showSnackBar(user.toString());
    setState(() {
      _isLoading=false;

    });
    var db = Databasehelper();
    await db.saveUser(user);
  }

}
