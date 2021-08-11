import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Text("Login"),
              TextFormField(
                decoration: InputDecoration(labelText: "Nome"),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
              ),
              // Container(
              //   height: MediaQuery.of(context).size.height,
              //   color: Colors.amber,
              // )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        child: Text("Entrar"),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              });
        },
      ),
    );
  }
}
