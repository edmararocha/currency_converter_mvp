import 'package:currency_coverter_mvp/app/mvp/features/currency_presenter.dart';
import 'package:flutter/material.dart';

import 'components/currency_box.dart';

class HomeView extends StatefulWidget {

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  late CurrencyPresenter currencyPresenter;

  @override
  void initState () {
    super.initState();
    currencyPresenter = CurrencyPresenter(fromText: fromText, toText: toText);
  }
  
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 100, bottom: 20),
          child: Column(
            children: [
              Image.asset("assets/currency-conversion.png"),
              SizedBox(height: 50,),

              CurrencyBox(
                selectedItem: currencyPresenter.toCurrency, 
                items: currencyPresenter.currencies, 
                controller: toText,
                onChanged: (model) {
                  setState(() {
                    currencyPresenter.toCurrency = model!;
                  });
                }, 
              ),
              
              SizedBox(height: 20,),
              
              CurrencyBox(
                selectedItem: currencyPresenter.fromCurrency, 
                items: currencyPresenter.currencies, 
                controller: fromText,
                onChanged: (model) {
                  setState(() {
                    currencyPresenter.fromCurrency = model!;
                  });
                }, 
              ),
              
              SizedBox(height: 50,),

              ElevatedButton(
                onPressed: () {
                  currencyPresenter.convert();
                }, 
                child: Text("CONVERTER"),
                style: ElevatedButton.styleFrom(primary: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}