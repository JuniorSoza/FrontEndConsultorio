import 'package:flutter/material.dart';
import 'package:odontologo/widgets/odontoligia_menu.dart';
import 'package:odontologo/routes.dart';


class MyAppMenu extends StatelessWidget {
  const MyAppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clínica Odontológica',
      theme: ThemeData(primarySwatch: Colors.teal),
      routes: AppRoutes.routes,
      home: HomeScreen(),
       debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _onMenuOptionSelected(BuildContext context, String option) {
    final routeMap = {
      'Historia Clínica': AppRoutes.historiaClinica,
      'Citas': AppRoutes.citas,
      'Tratamientos': AppRoutes.tratamientos,
      'Facturación': AppRoutes.facturacion,
      'Inventario': AppRoutes.inventario,
      'Configuración': AppRoutes.configuracion,
    };

    final routeName = routeMap[option];

    if (routeName != null) {
      Navigator.pushNamed(context, routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWide = constraints.maxWidth >= 800;

        return Scaffold(
          appBar: AppBar(title: Text('Clínica Odontológica')),
          drawer: isWide
              ? null
              : Drawer(
                  child: OdontologiaMenu(
                    onOptionSelected: (option) =>
                        _onMenuOptionSelected(context, option),
                  ),
                ),
          body: Row(
            children: [
              if (isWide)
                Container(
                  width: 250,
                  color: Colors.grey[200],
                  child: OdontologiaMenu(
                    onOptionSelected: (option) =>
                        _onMenuOptionSelected(context, option),
                  ),
                ),
              Expanded(
                child: Center(
                  child: Text(
                    'Selecciona una opción del menú',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/* import 'package:flutter/material.dart';
import 'package:odontologo/widgets/odontoligia_menu.dart';
import 'package:odontologo/screens/paciente.dart';


class MyAppMenu extends StatelessWidget {
  const MyAppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clínica Odontológica',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _onMenuOptionSelected(BuildContext context, String option) {
    Widget page;

    switch (option) {
      case 'Historia Clínica':
        page = const Paciente();
        break;
      case 'Citas':
        page = const Paciente();
        //page = const Citas();
        break;
      case 'Tratamientos':
        page = const Paciente();
        //page = const Tratamientos();
        break;
      case 'Facturación':
        page = const Paciente();
        //page = const Facturacion();
        break;
      case 'Inventario':
        page = const Paciente();
        //page = const Inventario();
        break;
      case 'Configuración':
        page = const Paciente();
        //page = const Configuracion();
        break;
      default:
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWide = constraints.maxWidth >= 800;

        return Scaffold(
          appBar: AppBar(title: Text('Clínica Odontológica')),
          drawer: isWide
              ? null
              : Drawer(
                  child: OdontologiaMenu(
                    onOptionSelected: (option) =>
                        _onMenuOptionSelected(context, option),
                  ),
                ),
          body: Row(
            children: [
              if (isWide)
                Container(
                  width: 250,
                  color: Colors.grey[200],
                  child: OdontologiaMenu(
                    onOptionSelected: (option) =>
                        _onMenuOptionSelected(context, option),
                  ),
                ),
              Expanded(
                child: Center(
                  child: Text(
                    'Selecciona una opción del menú',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

 */