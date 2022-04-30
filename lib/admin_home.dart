import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:toms_se_project/set_values.dart';
import 'functions.dart';

class admin_home extends StatefulWidget {
  double mq2;
  double ntu;
  admin_home({
    required this.mq2,
    required this.ntu,
  });

  @override
  State<admin_home> createState() => _admin_homeState();
}

// double random(min, max) {
//   return min + Random().nextInt(max - min);
// }

Random random = new Random();

class _admin_homeState extends State<admin_home> {
  Timer? timer;
  @override
  void initState() {
    timer = Timer.periodic(
      Duration(seconds: 10),
      (timer) {
        widget.mq2 = random.nextDouble() * 5;
        widget.ntu = random.nextDouble()*900;
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Live Values',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 140,
                      height: 140,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.mq2.toStringAsFixed(1),
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'MQ2 Value',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff444444),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 140,
                      height: 140,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.ntu.toStringAsFixed(0),
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'NTU Value',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff444444),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => set_values()));
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
                  child: Text(
                    "Set New Threshold Values",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "Poppins",
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
