import 'package:flutter/material.dart';
import 'package:toms_se_project/functions.dart';
import 'package:toms_se_project/home_page.dart';
import 'package:toms_se_project/register.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String password = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image(
                //   image: AssetImage('assets/onboarding_screen.png'),
                // ),

                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Email",
                    ),
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Password",
                    ),
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: TextFormField(
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(),
                //       labelText: 'Email',
                //     ),
                //   ),
                // ),

                ElevatedButton(
                  onPressed: () async {
                    String value = await signin(email, password);
                    if (value == 'true') {
                      current_user = email;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => HomePage()),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(value),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account ?',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => register()),
                          ),
                        );
                      },
                      child: Text(
                        'Register here!',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
