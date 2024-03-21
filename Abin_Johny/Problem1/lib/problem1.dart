import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyZeksta();
  }
}

class MyZeksta extends StatefulWidget {
  @override
  _MyZekstaState createState() => _MyZekstaState();
}

class _MyZekstaState extends State<MyZeksta> {
  final _patientController = TextEditingController();
  final _virusController = TextEditingController();
  String result = "";

  List<int> findVirusIndices(String patientDNA, String virusDNA) {
    List<int> matches = [];
    for (int i = 0; i < patientDNA.length - virusDNA.length + 1; i++) {
      int mismatchCount = 0;
      for (int j = 0; j < virusDNA.length; j++) {
        if (patientDNA[i + j] != virusDNA[j]) {
          mismatchCount++;
          if (mismatchCount > 1) {
            break;
          }
        }
      }
      if (mismatchCount <= 1) {
        matches.add(i);
      }
    }
    return matches;
  }

  void findMatches() {
    String patientDNA = _patientController.text.toLowerCase();
    String virusDNA = _virusController.text.toLowerCase();
    List<int> indices = findVirusIndices(patientDNA, virusDNA);
    setState(() {
      if (indices.isEmpty) {
        result = "No Match!";
      } else {
        result = indices.join(" ");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: const Icon(
          Icons.medical_services,
          color: Colors.white,
        ),
        title: const Text(
          'Virus Detector',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 150,
            ),
            TextField(
              controller: _patientController,
              decoration: const InputDecoration(
                  labelText: "Patient DNA",
                  suffixIcon: Icon(CupertinoIcons.person)),
            ),
            const SizedBox(height: 50.0),
            TextField(
              controller: _virusController,
              decoration: const InputDecoration(
                  labelText: "Virus DNA", suffixIcon: Icon(Icons.coronavirus)),
            ),
            const SizedBox(height: 90.0),
            ElevatedButton(
              onPressed: findMatches,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text(
                "Find Matches",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              result,
              style: const TextStyle(fontSize: 18.0),
            ),
          ]),
        ),
      ),
    );
  }
}
