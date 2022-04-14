import 'package:currency_coverter_mvp/app/mvp/features/login_presenter.dart';
import 'package:flutter/material.dart';

import '../../repository/login_repository.dart';

class LoginForm extends StatefulWidget {
  
  const LoginForm({Key? key,}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> implements LoginContract {

  late LoginPresenter presenter;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    presenter = LoginPresenter(LoginRepository(), this, );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void login() {
    setState(() {});
  }

  @override
  void loginError() {
    _scaffoldKey.currentState?.showBottomSheet<void>(
      (BuildContext context) {
        return Container(
          height: 40,
          color: Colors.red,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Login error'),
                SizedBox(height: 10,),
                ElevatedButton(
                    child: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          ),
        );
      }
    );
  }

  @override
  void loginSuccess() {
    Navigator.of(context).pushReplacementNamed("/home");
  }

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';

    return SingleChildScrollView(
      child: Form(
        child: Padding(
          key: presenter.formKey,
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 12),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 100,
              ),
              Text(presenter.formKey.currentState.toString()),
              Container(
                width: 150,
                height: 150,
                child: Image.asset("assets/currency-conversion.png"),
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'email',
                  labelStyle: TextStyle(color: Colors.black),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),

                onSaved: (value) =>presenter.userEmail(value!),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo não pode ser vazio';
                  } else if (!value.contains("@")) {
                    return 'Email não é válido';
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  labelText: 'password',
                  labelStyle: const TextStyle(color: Colors.black),
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),

                onSaved: (value) => presenter.userPassword(value!),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo não pode ser vazio';
                  }
                },
              ),
              const SizedBox(height: 30,),
              ElevatedButton(
                onPressed: presenter.isLoading ? null : presenter.login,
                style: ElevatedButton.styleFrom(primary: Colors.black),
                child: Container(
                  width: double.infinity,
                  child: const Text("Entrar", textAlign: TextAlign.center,)
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
