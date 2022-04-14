import 'package:currency_coverter_mvp/app/mvp/model/user_model.dart';
import 'package:currency_coverter_mvp/app/mvp/repository/login_repository.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginContract {
  void loginSuccess();
  void loginError();
  void login();
}

class LoginPresenter {

  final formKey = GlobalKey<FormState>();

  final LoginRepository loginRepository;
  final LoginContract loginContract;

  bool isLoading = false;
  
  LoginPresenter(this.loginRepository, this.loginContract);

  UserModel user = UserModel();

  userEmail(String value) => user.email = value;
  userPassword(String value) => user.password = value;

  login() async {
    bool isLogin;
    isLoading = true;
    loginContract.login();
    
    if (formKey.currentState!.validate()) {
      isLogin = false;
    } else {
      formKey.currentState!.save();

      try {
        isLogin = loginRepository.doLogin(user);
        print(isLogin);
      } catch (e) {
        isLogin = false;
      }
    }

    isLoading = false;
    loginContract.login();

    if (isLogin) {
      loginContract.loginSuccess();
    } else {
      loginContract.loginError();
    }
  }
}