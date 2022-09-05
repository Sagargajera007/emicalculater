import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class withoutdpemi extends StatefulWidget {
  const withoutdpemi({Key? key}) : super(key: key);

  @override
  State<withoutdpemi> createState() => _withoutdpemiState();
}

class _withoutdpemiState extends State<withoutdpemi> {

  List _tenureTypes = ['Month(s)', 'Year(s)'];
  String _tenureType = "Year(s)";
  String _emiResult = "";

  final TextEditingController _principalAmount = TextEditingController();
  final TextEditingController _interestRate = TextEditingController();
  final TextEditingController _tenure = TextEditingController();

  bool _switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Without Down Payment EMI"),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Loan Amount",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller:_principalAmount,
                      onChanged: (value) {},
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(hintText: "Ex:1,00,000"),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, top: 10, bottom: 10, right: 40),
                    child: Text(
                      "Interest %",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller:  _interestRate,
                      onChanged: (value) {},
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(hintText: "Ex: 7.90%"),
                      validator: (value) {
                        if (int.parse(value!) > 49) {
                          return "Please Enter Interest Leasthan 49%";
                        } else if (value.isEmpty) {
                          return "Please Enter Amount";
                        }
                      },
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, top: 10, bottom: 10, right: 70),
                    child: Text(
                      "Period",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
                    child: TextFormField(
                      controller: _tenure,
                      onChanged: (value) {},
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(hintText: "Ex: 10"),
                    ),
                  ),
                  Flexible(
                      flex: 2,
                      child: Column(
                          children: [
                            Text(_tenureType,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            Switch(
                                value: _switchValue,
                                onChanged: (bool value) {
                                  print(value);

                                  if( value ) {
                                    _tenureType = _tenureTypes[1];
                                  } else {
                                    _tenureType = _tenureTypes[0];
                                  }

                                  setState(() {
                                    _switchValue = value;
                                  });
                                }

                            )
                          ]
                      )
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10,),
                  ElevatedButton(onPressed: () {
                    _handleCalculation();
                  }, child: Text("Calculate")),
                  SizedBox(width: 10,),
                  ElevatedButton(onPressed: () {
                  }, child: Text("Reset"),)
                ],
              )
            ],
          ),
          Container(child:emiResultsWidget(_emiResult),),
        ],
      ),

    );
  }
  void _handleCalculation() {
    //  Amortization
    //  A = Payemtn amount per period
    //  P = Initial Printical (loan amount)
    //  r = interest rate
    //  n = total number of payments or periods

    double A = 0.0;
    int P = int.parse(_principalAmount.text);
    double r = int.parse(_interestRate.text) / 12 / 100;
    print(r);
    int n = _tenureType == "Year(s)"
        ? int.parse(_tenure.text) * 12
        : int.parse(_tenure.text);

    A = (P * r * pow((1 + r), n) / (pow((1 + r), n) - 1));

    _emiResult = A.toStringAsFixed(2);

    setState(() {});
  }

  Widget emiResultsWidget(emiResult) {
    bool canShow = false;
    String _emiResult = emiResult;

    if (_emiResult.length > 0) {
      canShow = true;
    }
    return Container(
        margin: EdgeInsets.only(top: 40.0),
        child: canShow
            ? Column(children: [
          Text("Your Monthly EMI is",
              style:
              TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          Container(
              child: Text(_emiResult,
                  style: TextStyle(
                      fontSize: 50.0, fontWeight: FontWeight.bold)))
        ])
            : Container());
  }
}
