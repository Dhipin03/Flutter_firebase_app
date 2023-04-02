import 'package:firebase_app/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class welcomepage extends StatelessWidget {
  String email;
  welcomepage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: w,
              height: h * .4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/signup.png"), fit: BoxFit.cover)),
            ),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "WELCOME",
                      style:
                          TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Food Donation App",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                )),
            SizedBox(
              height: 50,
            ),
            Text(
              email,
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
            SizedBox(
              height: 200,
            ),
            GestureDetector(
              onTap: () {
                AuthController.instance.logout();
              },
              child: Container(
                  width: 200,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage("img/loginbtn.png"),
                          fit: BoxFit.cover)),
                  child: Center(
                    child: Text("Sign out",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
