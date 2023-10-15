import 'package:flutter/material.dart';
import '../utils/network.dart';
import 'studantScreen.dart';

// ignore: must_be_immutable
class TelaLogin extends StatelessWidget  {

  TextStyle style = const TextStyle(fontFamily: 'Montserrat',fontSize: 20.0);

  final loginController = TextEditingController();
  final senhaController = TextEditingController();

  TelaLogin({super.key});

  @override
  Widget build(BuildContext context) {
     final emailField = TextField(
       controller: loginController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      controller: senhaController,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Senha",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),),
    );

    final buttonLogin = ElevatedButton(
      onPressed: () {
        var isValidUser = Newtwork.validateUser(loginController.text);
        if(isValidUser){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListCertificatesStudant()),
            );
        }else{
          Newtwork.showAlertDialog1(context);
        }
      },
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size((MediaQuery.of(context).size.width*0.6), (MediaQuery.of(context).size.height*0.05))),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              )
          )
      ),
      child: const Text('Entrar'),
    );
    return Scaffold(body: Center(
        child: SingleChildScrollView(
          child: Container(
              color: const Color(0xC9FAFAFA),
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 150.0,
                    child: Image.asset("assets/images/user_image.png",fit: BoxFit.contain),
                  ),
                  const SizedBox(height: 40.0),emailField,
                  const SizedBox(height: 20.0),passwordField,
                  const SizedBox(height: 30.0),buttonLogin,
                ],
              )
          ),
        )
    )
    );
  }
}