import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:toms_se_project/login.dart';
import 'package:http/http.dart' as http;

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var buttonValue = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      showAboutDialog(context: context,children: [Text("High MQ2 Value")]);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: ((context) => login()),
                ),
              );
            },
            icon: Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image(
              //   image: AssetImage('assets/gears.png'),
              //   height: 170,
              // ),
              Flexible(
                child: Container(
                  width: 250,
                  height: 250,
                  child: RiveAnimation.asset('assets/new_file.riv'),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              // ElevatedButton(
              //   style: ButtonStyle(
              //   backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
              //   ),
              //   onPressed: () {
              //     setState(() {
              //       if (buttonValue == true) {
              //         buttonText = 'Initiate System';
              //         buttonColor=Color(0xff0DCD0D);
              //         buttonValue = false;
              //       } else {
              //         buttonText = 'Stop System';
              //         buttonColor=Colors.red;
              //         buttonValue = true;
              //       }
              //     });
              //   },
              //   child: (Text(buttonText)),
              // )

              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    buttonValue ? Color(0xff0DCD0D) : Colors.red,
                  ),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  ),
                ),
                onPressed: () async {
                  setState(() {
                    buttonValue = !buttonValue;
                  });
                  if (buttonValue) {
                    await FirebaseMessaging.instance
                        .unsubscribeFromTopic('system');
                  } else {
                    await FirebaseMessaging.instance.subscribeToTopic('system');
                  }
                },
                child: buttonValue
                    ? Text(
                        'Initiate System',
                        style: TextStyle(fontSize: 16),
                      )
                    : Text(
                        'Stop System',
                        style: TextStyle(fontSize: 16),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
