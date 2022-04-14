import 'package:flutter/material.dart';

import '../../model/currency_model.dart';

class CurrencyBox extends StatelessWidget {

  final List<CurrencyModel> items;
  final CurrencyModel selectedItem;
  final TextEditingController controller;
  final void Function(CurrencyModel? model) onChanged;

  const CurrencyBox({Key? key, required this.items, required this.controller, required this.onChanged, required this.selectedItem}) 
  : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 56,
            child: DropdownButton<CurrencyModel>(
              iconEnabledColor: Colors.black,
              isExpanded: true,
              value: selectedItem,
              underline: Container(
                height: 1,
                color: Colors.black,
              ),

              items: items.map((e) =>  DropdownMenuItem(child: Text(e.name), value: e,))
              .toList(),
              onChanged: onChanged,
            ),
          )
        ),

        SizedBox(width: 10,),

        Expanded(
          flex: 2,
          child: TextField(
            controller: controller,
            decoration: 
              InputDecoration(
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              ),
          )
        ),
      ],
    );
  }
}