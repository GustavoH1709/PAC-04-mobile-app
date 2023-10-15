import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pac_04/utils/network.dart';

import '../utils/headerPage.dart';

class AdicionarCertificado extends StatefulWidget {
  const AdicionarCertificado({super.key});

  @override
  State<AdicionarCertificado> createState() => _AdicionarCertificado();
}

class _AdicionarCertificado extends State<AdicionarCertificado> {
  var nomeCursoController = TextEditingController();
  var nomeCertificadoController = TextEditingController();
  var horasCertificadoController = TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;


  void addCertificate() {
    try {
      final certificate = <String, dynamic>{
        "nomeCurso": nomeCursoController.text,
        "nomeCertificado": nomeCertificadoController.text,
        "horasCertificado":horasCertificadoController.text
      };


      db.collection("certificate").add(certificate).then((DocumentReference doc) =>
          print('DocumentSnapshot added with ID: ${doc.id}'));
    }
    catch (err) {
      debugPrint(err.toString());
    }
  }

  int numberCertificates = 1;

  Row getCertificateAdd() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: fieldGenerator("Titulo Certificado",nomeCertificadoController),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              child: fieldGenerator("Horas",horasCertificadoController)
          )
        ]
    );
  }

  SizedBox fieldGenerator(String fieldName,TextEditingController controller) {
    return SizedBox(
        width: 250,
        child: TextField(
          controller: controller,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: fieldName,
            ))
    );
  }

  @override
  Widget build(BuildContext context) {
    var listCertificates = <Widget>[];
    listCertificates.add(getCertificateAdd());

    return Scaffold(
      body: SingleChildScrollView(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Header.getHeader("Adicionar Certificado"),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Text("Informe o nome do curso:"),
                      const SizedBox(height: 5),
                      SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 30,
                          child: SizedBox(
                            height: 36,
                            child: TextField(
                              controller:nomeCursoController,
                              maxLines: 1,
                              style: const TextStyle(fontSize: 17),
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                filled: true,
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(30))),
                                fillColor: Theme
                                    .of(context)
                                    .inputDecorationTheme
                                    .fillColor,
                                contentPadding: const EdgeInsets.only(left: 5),
                              ),
                            ),
                          )
                      )
                    ],
                  ),
                ),
                SizedBox(
                    width: 800,
                    child: ListView.builder(shrinkWrap: true,
                        itemCount: numberCertificates,
                        itemBuilder: (_, index) {
                          return getCertificateAdd();
                        })),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      onPressed: () =>
                      {
                        addCertificate(),
                        Newtwork.criar(context)
                      }, child: const Text("Enviar certificados")),
                )
              ],
            )
        ),
      );
  }
}
