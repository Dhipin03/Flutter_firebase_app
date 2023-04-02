import 'package:firebase_app/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_app/auth_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
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
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage("img/signup.png"),
                        fit: BoxFit.cover)),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hello",
                      style:
                          TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "sign into your account",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 7,
                                offset: const Offset(1, 1),
                                color: Colors.grey.withOpacity(.2))
                          ]),
                      child: TextField(
                        controller: emailController,
                          decoration: InputDecoration(
                              hintText: "Email id",
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Color.fromARGB(255, 240, 206, 38),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 1.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 1.0)))),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  spreadRadius: 7,
                                  offset: const Offset(1, 1),
                                  color: Colors.grey.withOpacity(.2))
                            ]),
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: const Icon(
                                Icons.password,
                                color: Color.fromARGB(255, 240, 206, 38),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 246, 226, 226),
                                      width: 1.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(30))),
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        const Text(
                          "forgot your password?",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: (){
                  AuthController.instance.login(emailController.text.trim(), passwordController.text.trim());
                },
                child: Container(
                    width: 200,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                            image: AssetImage("img/loginbtn.png"),
                            fit: BoxFit.cover)),
                    child: const Center(
                      child: Text("Login",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    )),
              ),
              const SizedBox(
                height: 50,
              ),
              RichText(
                  text: TextSpan(
                      text: "Don't have an account?",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                      children: [
                    TextSpan(
                        text: " Create",
                        style: TextStyle(
                            color: Color.fromARGB(255, 72, 71, 71),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () => {Get.to(() => SignupPage())})
                  ]))
            ],
          ),
        ));
  }
}
