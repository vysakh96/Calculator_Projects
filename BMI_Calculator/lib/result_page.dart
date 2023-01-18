import 'package:flutter/material.dart';

class resultPage extends StatefulWidget {
  // const resultPage({Key? key}) : super(key: key);
  double height;
  int weight;
  int age;
  resultPage(this.height, this.weight, this.age);

  @override
  State<resultPage> createState() => _resultPageState();
}

class _resultPageState extends State<resultPage> {
  void initState() {
    super.initState();
    calculation();
  }

  double result = 0, heightInMeter = 0;
  String summary = '';
  void calculation() {
    setState(() {
      heightInMeter = widget.height / 100;
      result = widget.weight / (heightInMeter * heightInMeter);
      if (result < 18.5) {
        summary = 'Under Weight';
      } else if (result >= 18.5 && result <= 24.9) {
        summary = 'Normal';
      } else if (result >= 25 && result <= 29.9) {
        summary = 'Over Weight';
      } else if (result >= 30 && result <= 39.9) {
        summary = 'Obese';
      } else {
        summary = 'Extremely Obese';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'RESULT',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 30, color: Colors.red),
            ),
          ),
          Container(
            padding: EdgeInsets.all(40),
            margin: EdgeInsets.all(10),
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[800],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'WEIGHT',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'AGE',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'RESULT',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.height.round().toString()} cm',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${widget.weight} kg',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${widget.age}',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${result.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                'SUMMARY : $summary',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.yellow,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            width: double.maxFinite,
            color: Colors.red,
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'CALCULATE AGAIN',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
