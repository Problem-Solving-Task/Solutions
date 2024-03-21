import 'package:flutter/material.dart';
import 'package:problem2/problem2login.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
              ),
              child: Text("Index",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            ListTile(
                title: const Text("Profile",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                trailing: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyProfile()));
                }),
            ListTile(
              title: const Text("LogOut",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              trailing: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyZekstaForm()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "PROFILE",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "Here we are..!",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            const SizedBox(
              height: 70,
            ),
            const Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://assets.static-upwork.com/org-logo/1278360521494171648",
                ),
                radius: 90,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const Text(
                    "App ID",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Phone Number",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Email address",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 45,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            minimumSize: const Size(150, 40),
                          ),
                          child: const Text("Add Details",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            minimumSize: const Size(150, 40),
                          ),
                          child: const Text("Share Profile",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
