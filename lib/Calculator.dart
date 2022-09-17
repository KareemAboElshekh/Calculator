import 'package:calculator/CalculatorButoon.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(result.isEmpty ? "0.0" : result,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24)),
            ],
          )),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalculatorButoon(text: "7", onPressed: onDigitClicked),
              CalculatorButoon(text: "8", onPressed: onDigitClicked),
              CalculatorButoon(text: "9", onPressed: onDigitClicked),
              CalculatorButoon(text: "*", onPressed: onOperatorClicked),
            ],
          )),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalculatorButoon(text: "4", onPressed: onDigitClicked),
              CalculatorButoon(text: "5", onPressed: onDigitClicked),
              CalculatorButoon(text: "6", onPressed: onDigitClicked),
              CalculatorButoon(text: "/", onPressed: onOperatorClicked),
            ],
          )),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalculatorButoon(text: "1", onPressed: onDigitClicked),
              CalculatorButoon(text: "2", onPressed: onDigitClicked),
              CalculatorButoon(text: "3", onPressed: onDigitClicked),
              CalculatorButoon(text: "-", onPressed: onOperatorClicked),
            ],
          )),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalculatorButoon(text: ".", onPressed: onDigitClicked),
              CalculatorButoon(text: "0", onPressed: onDigitClicked),
              CalculatorButoon(text: "+", onPressed: onOperatorClicked),
              CalculatorButoon(text: "=", onPressed: onEqualClicked),
            ],
          ))
        ],
      ),
    );
  }

  String LHS = "";
  String operator = "";

  void onDigitClicked(String digit) {
    if (digit == "." && result.contains(".")) {
      return;
    }
    result += digit;
    setState(() {});
  }

  void onOperatorClicked(String clickedOperator) {
    if (operator.isEmpty) {
      LHS = result;
      operator = clickedOperator;
      result = "";
      setState(() {});
    } else {
      String RHS = result;

      double res = calculate(LHS, operator, RHS);
      LHS = res.toString();
      operator = clickedOperator;
      result = "";
      setState(() {});
    }
    print(LHS);
  }

  void onEqualClicked(_) {
    double res = calculate(LHS, operator, result);
    result = res.toString();
    operator = "";
    LHS = "";
    setState(() {});
  }

  double calculate(String LHS, String operator, String RHS) {
    double lhs = double.parse(LHS);
    double rhs = double.parse(RHS);
    if (operator == "+") {
      return lhs + rhs;
    } else if (operator == "-") {
      return lhs - rhs;
    } else if (operator == "*") {
      return lhs * rhs;
    } else {
      return lhs / rhs;
    }
  }
}
