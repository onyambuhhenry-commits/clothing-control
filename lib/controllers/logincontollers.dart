import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  bool login(String username, String password) {
    // Implement your login logic here
    // For example, check against auth_store or hardcoded values
    if (username == 'admin' && password == 'password') {
      return true;
    }
    return false;
  }
}

LoginController loginController = Get.put(LoginController());
TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  String _username = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text(
          "Login Screen",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/profileclass.jpg', height: 100, width: 100),
              const Text(
                "Login Screen",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.fromLTRB(10, 5, 10, 0)),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Enter username",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "username",
                  prefixIcon: const Icon(Icons.person),
                ),
                onChanged: (value) => _username = value.trim(),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Enter password",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Enter password",
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: const Icon(Icons.visibility),
                ),
                onChanged: (value) => _password = value,
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  bool success = loginController.login(
                    usernameController.text,
                    passwordController.text,
                  );
                  if (success) {
                    Get.offNamed("/home");
                  } else {
                    Get.snackbar(
                      "Login Failed",
                      "Invalid username or password.",
                    );
                  }
                },
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(color: Colors.cyanAccent),
                  child: const Text(
                    "Login!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  const Text("Don't have an account?"),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/signup");
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(color: Color.fromARGB(255, 23, 168, 18)),
                    ),
                  ),
                  const Spacer(),
                  const Text("Forgot password?"),
                  const Text(
                    "Reset",
                    style: TextStyle(color: Color.fromARGB(255, 6, 90, 3)),
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
