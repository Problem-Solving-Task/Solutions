import 'package:flutter/material.dart';
import 'package:problem2/problem2signup.dart';

class Forgotpas extends StatefulWidget {
  const Forgotpas({Key? key}) : super(key: key);

  @override
  State<Forgotpas> createState() => _ForgotpasState();
}

class _ForgotpasState extends State<Forgotpas> {
  bool _obscureText = true; // Initially password is hidden

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final _formKey = GlobalKey<FormState>();
  String _password = "";
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _passwordsMatch = true;

  void _handleReset() {
    _passwordController.text = "";
    _confirmPasswordController.text = "";
    setState(() {
      _passwordsMatch = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Forgot Password",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "atleast 6 characters",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Password',
                  errorText: _passwordsMatch ? null : 'Passwords do not match',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
                obscureText: _obscureText,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password.';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters.';
                  }
                  _password = value;
                  return null;
                },
              ),
              const SizedBox(height: 30.0),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Confirm Password',
                  errorText: _passwordsMatch ? null : 'Passwords do not match',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
                obscureText: _obscureText,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please confirm your password.';
                  } else if (value != _password) {
                    return 'Passwords do not match.';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 280,
                  ),
                  TextButton(
                    onPressed: _handleReset,
                    child: const Text(
                      'Reset',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(370, 50),
                        backgroundColor: Colors.pink),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Navigate to next page
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MySignUp()));
                      }
                    },
                    child: const Text(
                      'S A V E',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
