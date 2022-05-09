import 'package:flutter/material.dart';
import 'package:toms_se_project/admin_home.dart';
import 'package:toms_se_project/admin_home_page.dart';

  double curr_mq2_value = 0, curr_ntu_value = 0;
  double mq2_value = 0, ntu_value = 0;

class set_values extends StatefulWidget {
  const set_values({Key? key}) : super(key: key);

  @override
  State<set_values> createState() => _set_valuesState();
}

class _set_valuesState extends State<set_values> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 240,
                height: 166,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 10,
                      offset: Offset(0, 1),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "MQ2 Value",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff444444),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      mq2_value.toStringAsFixed(1),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff0094ff),
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Slider(
                      value: mq2_value,
                      max: 5.0,
                      divisions: 50,
                      // label: mq2_value.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          mq2_value = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Current MQ2 threshold: ${curr_mq2_value.toStringAsFixed(1)}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff444444),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 240,
                height: 166,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 10,
                      offset: Offset(0, 1),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "NTU Value",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff444444),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      ntu_value.toStringAsFixed(0),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff0094ff),
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Slider(
                      value: ntu_value,
                      max: 900,
                      divisions: 900,
                      // label: ntu_value.round().toString(),
                      onChanged: (double value) {
                        setState(
                          () {
                            ntu_value = value;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Current NTU threshold: ${curr_ntu_value.toStringAsFixed(0)}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff444444),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    curr_mq2_value = mq2_value;
                    curr_ntu_value = ntu_value;
                  });
                  // print(mq2_value);
                  // print(curr_mq2_value);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 75),
                  child: Text(
                    "Save",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
