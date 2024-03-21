import 'package:flutter/material.dart';
import 'package:problem2/problem2login.dart';

class MySignUp extends StatefulWidget {
  const MySignUp({Key? key}) : super(key: key);

  @override
  State<MySignUp> createState() => _MySignUpState();
}

class _MySignUpState extends State<MySignUp> {
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController conpassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _passwordsMatch = true;

  void _handleReset() {
    password.text = "";
    conpassword.text = "";
    phone.text = "";
    email.text = "";
    setState(() {
      _passwordsMatch = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Column(children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Sign Up",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Create your account",
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  // keyboardType: TextInputType.numberWithOptions(),
                  controller: phone,
                  decoration: const InputDecoration(
                    labelText: "Phone Number",
                    labelStyle: TextStyle(color: Colors.pinkAccent),
                    prefixIcon: Icon(Icons.call),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.pinkAccent)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || phone == null) {
                      return 'this field is required';
                    }
                    if (RegExp(r'(^(?:[+0]9)?[0-9]{10}$)').hasMatch(value!)) {
                      return 'Enter a valid phone number';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is required';
                    }
                    if (!value.contains('@')) {
                      return "A valid email should contains '@'";
                    }
                    if (!RegExp(
                            r"[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.[a-zA-Z]{2,}")
                        .hasMatch(value)) {
                      return "Please enter a valid email";
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      prefixIcon: Icon(Icons.person),
                      labelText: "EMAIL",
                      labelStyle: TextStyle(color: Colors.pinkAccent)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  TextField(
                    controller: password,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Colors.pinkAccent),
                      prefixIcon: const Icon(Icons.lock),
                      errorText:
                          _passwordsMatch ? null : 'Passwords do not match',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 30.0),
                  TextField(
                    controller: conpassword,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      labelText: 'Confirm Password',
                      labelStyle: const TextStyle(color: Colors.pinkAccent),
                      prefixIcon: const Icon(Icons.lock),
                      errorText:
                          _passwordsMatch ? null : 'Passwords do not match',
                    ),
                    obscureText: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 230),
                    child: TextButton(
                      onPressed: _handleReset,
                      child: const Text(
                        'Reset',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ),
                ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyZekstaForm()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(380, 50),
                        backgroundColor: Colors.pink),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ]))));
  }
}
