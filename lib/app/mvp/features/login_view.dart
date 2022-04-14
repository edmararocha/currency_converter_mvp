import 'package:currency_coverter_mvp/app/mvp/features/components/login_form.dart';
import 'package:currency_coverter_mvp/app/mvp/features/login_presenter.dart';
import 'package:currency_coverter_mvp/app/mvp/repository/login_repository.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: LoginForm(),
    );
  }
}
