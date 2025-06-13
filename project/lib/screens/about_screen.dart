import 'package:flutter/material.dart';
import '../variables_globales.dart';
import '../widgets/card_container.dart';
import '../widgets/top_menu.dart';

// ignore: camel_case_types
class About_scren extends StatelessWidget {
  const About_scren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TopMenuSuperior(title: 'Acerca de',),
        body: Container(
          color: Colors.grey[350],
          width: double.infinity,
          height: double.infinity,
            child: SingleChildScrollView(
                child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                    CardContainerForm(
                      child: Column(
                        children: [
                          const Center(child:Text('INFORMACIÓN DEL APP', style: TextStyle(fontWeight: FontWeight.bold))),
                          Row(
                            children: [
                              const Text("Usuario: ", style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(usuario)
                            ],
                          )
                        ],
                      )
                    )
                    ]
                )
            )
        )
    );
  }
}
