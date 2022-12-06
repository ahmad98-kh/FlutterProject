import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  var username, password;
  GlobalKey<FormState> myform = new GlobalKey<FormState>();

  printdata() {
    var mydata = myform.currentState;
    if (mydata!.validate()) {
      mydata.save();
      print(username);
      print(password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(40),
        child: ListView(
          children: [
            Center(
                child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("images/viva.png"),
                const SizedBox(
                  height: 20,
                ),
                Form(
                    key: myform,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Username";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (newValue) {
                            newValue = username;
                          },
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: "Enter UserName",
                              // labelText: "UserName",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Password";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (newValue) {
                            newValue = password;
                          },
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.password_sharp),
                              hintText: "Pasword",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)..pushNamed("HomePage");
                            },
                            child: Text("Login"))
                      ],
                    ))
              ],
            )),
          ],
        ),
      ),
    );
  }
}
