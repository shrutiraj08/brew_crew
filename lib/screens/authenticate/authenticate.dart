import 'package:brew_crew/screens/authenticate/register.dart'as rg;
import 'package:brew_crew/screens/authenticate/sign_in.dart' as sg;
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    //print(showSignIn.toString());
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return rg.Register(toggleView: toggleView);
    } else {
      return sg.SignIn(toggleView: toggleView);
    }
  }
}
