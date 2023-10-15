import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:pac_04/utils/network.dart';

import 'addCertificate.dart';

import 'addCertificate.dart';
import 'certificateDetails.dart';


class CertificateDto{
  String nameCertificate = "";
  String courseCertificate = "";
  String horasCertificate = "";
}

class ListCertificatesStudant extends StatefulWidget{
  const ListCertificatesStudant({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ListCertificatesStudant createState()=>_ListCertificatesStudant();
}

class _ListCertificatesStudant extends State<ListCertificatesStudant> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  void getCertificatesFromBD() async {
    var query = await db.collection("certificate").get();

    for (var doc in query.docs) {
      var dto = CertificateDto();
      dto.horasCertificate = doc.data()["horasCertificado"];
      dto.courseCertificate  = doc.data()["nomeCurso"];
      dto.nameCertificate = doc.data()["nomeCertificado"];
      setState((){
        listCertificados.add(dto);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getCertificatesFromBD();
  }

  List<CertificateDto> listCertificados = [];
  @override


  @override
  Widget build(BuildContext context) {

    List<Widget> getCertificateRegister() {

      var listObj = <Widget>[];
      for (var element in listCertificados) {
        listObj.add( Container(
          width: 290,
          height: 110,
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 217, 217, 217),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Container(
                  margin: const EdgeInsets.all(20),
                  width: 160,
                  child: Column(
                    children: [
                      Text(element.courseCertificate,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                            const MaterialStatePropertyAll<Color>(Colors.grey),
                            shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ))),
                        child: const Text(
                          'Pendente',
                          style: TextStyle(fontSize: 12.0),
                        ),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CertificateDetails(Horas: element.horasCertificate)),
                          )
                        },
                      ),
                    ],
                  )),
              Container(
                width: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Horas:", style: TextStyle(fontSize: 10)),
                    Text("${element.horasCertificate}h",
                        style:
                        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              IconButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CertificateDetails(Horas: element.horasCertificate)),
                    ),
                  },
                  icon: const Icon(Icons.more_vert))
            ],
          ),
        ));
      }

      return listObj;

    }

    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(100, 217, 217, 217),
                      border: Border(
                          bottom: BorderSide(
                              color: Color.fromARGB(255, 217, 217, 217)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 45.0,
                          child: Image.asset("assets/images/user_image.png",
                              fit: BoxFit.contain)),
                      SizedBox(width: 10),
                      const Text(
                        "Certificados",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  )),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: Text(
                    'Lista de Certificados',
                    style: TextStyle(fontSize: 30),
                  )),
                ],
              ),
              SizedBox(height: 20),
              Divider(
                  height: 3,
                  color: Color.fromARGB(255, 217, 217, 217),
                  indent: 30,
                  endIndent: 30),
              Column(children: getCertificateRegister()
              )
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AdicionarCertificado()),
            );
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ));
  }
}
