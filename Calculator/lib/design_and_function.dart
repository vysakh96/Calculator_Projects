import 'package:flutter/material.dart';

class calculator extends StatefulWidget {
  const calculator({Key? key}) : super(key: key);

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'CALCULATOR',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 170,
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          history,
                          style: TextStyle(color: Colors.white54, fontSize: 30),
                        ),
                        Text(
                          num,
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                button('C', Colors.grey),
                button('⟵', Colors.grey),
                button('%', Colors.grey),
                button('÷', Colors.amber),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                button('7', Colors.white),
                button('8', Colors.white),
                button('9', Colors.white),
                button('⨯', Colors.amber),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                button('4', Colors.white),
                button('5', Colors.white),
                button('6', Colors.white),
                button('-', Colors.amber),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                button('1', Colors.white),
                button('2', Colors.white),
                button('3', Colors.white),
                button('+', Colors.amber),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                buttonEnd('0', Colors.white),
                buttonEnd('.', Colors.white),
                buttonEnd('=', Colors.amber),
              ],
            ),
          ],
        ),
      ),
    );
  }

  button(String number, Color colorName) {
    return Expanded(
      child: FloatingActionButton(
        onPressed: () {
          getNumber(number);
        },
        child: Text(
          number,
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: colorName,
      ),
    );
  }

  buttonEnd(String number, Color colorName) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ElevatedButton(
          onPressed: () {
            getNumber(number);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              number,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          style: ElevatedButton.styleFrom(backgroundColor: colorName),
        ),
      ),
    );
  }

  String num = '';
  String res = '';
  int number1 = 0, number2 = 0;
  String opp = '';
  String history = '';
  void getNumber(String btnText) {
    setState(() {
      if (btnText == 'C') {
        num = '';
        res = '';
        history = '';
        opp = '';
        number1 = 0;
        number2 = 0;
      } else if (btnText == '⟵') {
        res = num.substring(0, num.length - 1);
        // }
        // else if (btnText == '.') {
        //   if (num.contains('.')) {
        //     return;
        //   } else {
        //     num = num + btnText;
        //   }
      } else if (btnText == '+' ||
          btnText == '-' ||
          btnText == '⨯' ||
          btnText == '÷' ||
          btnText == '%') {
        number1 = int.parse(num);
        res = '';
        opp = btnText;
      } else if (btnText == '=') {
        number2 = int.parse(num);
        if (opp == '+') {
          res = (number1 + number2).toString();
          history = number1.toString() + opp.toString() + number2.toString();
        }
        if (opp == '-') {
          res = (number1 - number2).toString();
          history = number1.toString() + opp.toString() + number2.toString();
        }
        if (opp == '⨯') {
          res = (number1 * number2).toString();
          history = number1.toString() + opp.toString() + number2.toString();
        }
        if (opp == '÷') {
          res = (number1 / number2).toString();
          history = number1.toString() + opp.toString() + number2.toString();
        }
        if (opp == '%') {
          res = (number1 * number2 / 100).toString();
          history = number1.toString() + opp.toString() + number2.toString();
        }
      } else {
        res = int.parse(num + btnText).toString();
        print(res);
      }
      num = res;
    });
  }
}
