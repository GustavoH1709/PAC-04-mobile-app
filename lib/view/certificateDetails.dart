import 'package:flutter/material.dart';

import '../utils/headerPage.dart';

class CertificateDetails extends StatelessWidget {
  final String Horas;
  const CertificateDetails({required this.Horas});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Header.getHeader("Detalhes"),
            Container(
              margin: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  const Text("Engenharia de Software",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Icon(Icons.circle, color: Colors.grey, size: 25),
                      SizedBox(width: 2),
                      Text("Vini", style: TextStyle(fontSize: 20))
                    ],
                  ),
                  const SizedBox(height: 15),
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: const Text("Documento:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22)),
                  ),
                  Center(
                      child: Container(
                          width: 450,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 217, 217, 217),
                              borderRadius: BorderRadius.circular(7)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.insert_drive_file_outlined),
                              const SizedBox(width:20),
                              const Text("Documento", style: TextStyle(fontSize: 15)),
                              const SizedBox(width: 100),
                              Column(
                                children: [
                                  const Text("Horas:",
                                      style: TextStyle(fontSize: 10)),
                                  Text("${Horas}h",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                              IconButton(
                                  onPressed: () => {},
                                  icon: const Icon(Icons.more_vert))
                            ],
                          ))),
                  const SizedBox(height: 10),
                  const Text("Status: ",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 10),
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(255, 141, 141, 141)),
                    child: const Text("Pendente",
                        style: TextStyle(fontSize: 15,letterSpacing: 1.3,color: Colors.white,fontWeight:FontWeight.bold)),
                  ),
                ],
              ),
            )
          ]),     
      ),
    );
  }
}
