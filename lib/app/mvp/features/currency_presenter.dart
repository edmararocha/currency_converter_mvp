import 'package:currency_coverter_mvp/app/mvp/repository/currency_repository.dart';
import 'package:flutter/material.dart';

import '../model/currency_model.dart';

class CurrencyPresenter {
  final TextEditingController toText;
  final TextEditingController fromText;
  
  late List<CurrencyModel> currencies; 
  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;

  CurrencyPresenter ({required this.fromText, required this.toText}) {
    currencies = CurrencyRepository.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];  
  }

  void convert () {
    String text = toText.text;
    print(text);
    double value = double.tryParse(text.replaceAll(",", ".")) ?? 1.0;
    print("Value: $value");
    double returnValue = 0;

    if(fromCurrency.name == 'Real') {
      if(value != null) {
        returnValue = (value * toCurrency.real);
      }
    } else if(fromCurrency.name == 'Dolar') {
      if(value != null) {
        returnValue = (value * toCurrency.dolar);
      }
    } else if(fromCurrency.name == 'Euro') {
      if(value != null) {
        returnValue = (value * toCurrency.euro);
      }
    } else if(fromCurrency.name == 'Bitcoin') {
      if(value != null) {
        returnValue = (value * toCurrency.bitcoin);
      }
    }    

    fromText.text = returnValue.toStringAsFixed(2);
    print(fromText.text);
  }
}