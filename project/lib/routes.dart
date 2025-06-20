import 'package:flutter/material.dart';
//import 'package:odontologo/main.dart';
import 'package:odontologo/screens/paciente.dart';
import 'package:odontologo/widgets/main_menu.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String menu = '/menu';
  static const String historiaClinica = '/historia_clinica';
  static const String citas = '/citas';
  static const String tratamientos = '/tratamientos';
  static const String facturacion = '/facturacion';
  static const String inventario = '/inventario';
  static const String configuracion = '/configuracion';

  static Map<String, WidgetBuilder> routes = {
    //initialRoute: (context) => const MyHomePage(title: 'Clínica Odontológica',),
    menu: (context) => const MyAppMenu(),
    historiaClinica: (context) => const Paciente(),
    citas: (context) => const Paciente(),
    tratamientos: (context) => const Paciente(),
    facturacion: (context) => const Paciente(),
    inventario: (context) => const Paciente(),
    configuracion: (context) => const Paciente(),
  };
}
