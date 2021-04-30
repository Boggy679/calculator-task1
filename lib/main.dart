import 'dart:math';

import 'package:calcu/distance.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PowerCalculationScreen(),
    );
  }
}

class PowerCalculationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PowerCalculationWidget(),
        )
    );
  }
}

class PowerCalculationWidget extends StatefulWidget {
  @override
  _PowerCalculationWidgetState createState() => _PowerCalculationWidgetState();
}

class _PowerCalculationWidgetState extends State<PowerCalculationWidget> {
  double base;
  double exponent;
  String result = '';
  bool dataIsEntered = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Enter base'
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (String base) {
                        if (base.isNotEmpty) {
                          this.base = double.parse(base.replaceAll(",", '.'));
                          if (this.base != null && this.exponent != null) {
                            setState(() {
                              dataIsEntered = true;
                            });
                          }
                        } else {
                          this.base = null;
                          setState(() {
                            dataIsEntered = false;
                          });
                        }
                      },
                    )),
                Expanded(child: Center(child: Text('^', style: TextStyle(fontSize: 40),))),
                Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Enter exponent'
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (String power) {
                        if (power.isNotEmpty) {
                          this.exponent = double.parse(power.replaceAll(",", '.'));
                          if (this.base != null && this.exponent != null) {
                            setState(() {
                              dataIsEntered = true;
                            });
                          }
                        } else {
                          this.exponent = null;
                          setState(() {
                            dataIsEntered = false;
                          });
                        }
                      },
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Result: $result", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text("Power"),
              onPressed: dataIsEntered
                  ? () {
                setState(() {
                  result = calculatePower(base, exponent).toString();
                });
              }
                  : null,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text("Multiply"),
              onPressed: dataIsEntered
                  ? () {
                setState(() {
                  result = multiply(base, exponent).toString();
                });
              }
                  : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text("Divide"),
              onPressed: dataIsEntered
                  ? () {
                setState(() {
                  result = divide(base, exponent).toString();
                });
              }
                  : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text("Minus"),
              onPressed: dataIsEntered
                  ? () {
                setState(() {
                  result = minus(base, exponent).toString();
                });
              }
                  : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text("Plus"),
              onPressed: dataIsEntered
                  ? () {
                setState(() {
                  result = plus(base, exponent).toString();
                });
              }
                  : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text("Distance converter"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Distance()),
                );
              },
            ),
          ),

        ],
      ),
    );
  }

  double calculatePower(double base, double exponent) => pow(base, exponent);

  double minus(double base, double exponent) => (base-exponent);

  double plus(double base, double exponent) => (base + exponent);
  double multiply(double base, double exponent) =>(base * exponent);
  double divide(double base, double exponent) => (base / exponent);

}