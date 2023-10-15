import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/studantScreen.dart';

class Newtwork  {

  static showAlertDialog1(BuildContext context)
  {
    // configura o button
    Widget okButton = ElevatedButton(
      child: const Text("OK"),
      onPressed: () { },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: const Text("Login Inválido ou senha inválido"),
      content: const Text("Por favor, tente novamente!"),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }


  static criar(BuildContext context)
  {
    // configura o button
    Widget okButton = ElevatedButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ListCertificatesStudant()),
        );
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: const Text("Certificado criado com sucesso."),
      content: const Text("Agora seu certificado está pendente de aprovação."),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  static bool validateUser(String email){
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
    .hasMatch(email); 
  }
}