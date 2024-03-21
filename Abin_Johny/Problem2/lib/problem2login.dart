import 'package:flutter/material.dart';
import 'package:problem2/problem2signup.dart';
import 'problem2forgot.dart';
import 'problem2otptext.dart';

class MyZekstaForm extends StatefulWidget {
  const MyZekstaForm({Key? key}) : super(key: key);

  @override
  State<MyZekstaForm> createState() => _MyZekstaFormState();
}

class _MyZekstaFormState extends State<MyZekstaForm> {
  bool _obscureText = true; // Initially password is hidden

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Welcome Back",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Enter your credential to login",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is required';
                    }
                   else if (!value.contains('@')) {
                      return "A valid email should contains '@'";
                    }
                   else if (!RegExp(
                            r"[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.[a-zA-Z]{2,}")
                        .hasMatch(value)) {
                      return "Please enter a valid email";
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      prefixIcon: Icon(Icons.person),
                      hintText: "enter your Email",
                      labelText: "EMAIL",
                      labelStyle: TextStyle(color: Colors.pinkAccent)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: password,
                  validator: (value) {
                    if (value!.isEmpty ||
                        RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*)[a-z A-Z]{8,}")
                            .hasMatch(value!)) {
                      return 'Enter correct passcode';
                    } else {
                      return null;
                    }
                  },
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Enter your Password',
                    labelText: 'PASSWORD',
                    labelStyle: const TextStyle(color: Colors.pinkAccent),
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.security),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 250,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Forgotpas()));
                      },
                      child: const Text(
                        "forgot password",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w300),
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              //login block starts here
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OtpText()));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  minimumSize: const Size(380, 50),
                ),
                child: const Text("Login",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 120,
                  ),
                  const Text(
                    "Don't have an account",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MySignUp()));
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.pinkAccent),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
