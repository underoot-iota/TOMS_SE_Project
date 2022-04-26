import 'package:flutter/material.dart';

class admin_profile extends StatefulWidget {
  const admin_profile({Key? key}) : super(key: key);

  @override
  State<admin_profile> createState() => _admin_profileState();
}

class _admin_profileState extends State<admin_profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
        ),
      ),
    );
  }
}
