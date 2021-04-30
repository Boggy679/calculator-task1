import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Distance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Converter"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CalculationWidget(),
        )
    );
  }
}

class CalculationWidget extends StatefulWidget {
  @override
  _CalculationWidgetState createState() => _CalculationWidgetState();
}

class _CalculationWidgetState extends State<CalculationWidget> {
  double value;
  String result = '';
  bool dataIsEntered = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                      decoration: InputDecoration(hintText: 'Value to convert'),
                      keyboardType: TextInputType.number,
                      onChanged: (String number) {
                        if (number.isNotEmpty) {
                          this.value = double.parse(number.replaceAll(",", '.'));
                          if (this.value != null) {
                            setState(() {
                              dataIsEntered = true;
                            });
                          }
                        } else {
                          this.value = null;
                          setState(() {
                            dataIsEntered = false;
                          });
                        }
                      },
                    )),

                Expanded(
                  child: Text(
                    "$result",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: ElevatedButton(
              child: Text("To miles"),
              onPressed: dataIsEntered
                  ? () {
                setState(() {
                  result = miles(value).toString();
                });
              }
                  : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: ElevatedButton(
              child: Text("To kilometers"),
              onPressed: dataIsEntered
                  ? () {
                setState(() {
                  result = Kilometers(value).toString();
                });
              }
                  : null,
            ),
          ),
        ],
      ),
    );
  }
    double miles(double number) => (number / 1.609);

    double Kilometers(double number) => (number * 1.609);

}