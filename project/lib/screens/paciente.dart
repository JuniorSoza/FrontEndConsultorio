
//import 'dart:convert';
//import 'package:rflutter_alert/rflutter_alert.dart';
//import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import 'package:odontologo/variables_globales.dart';
import 'package:odontologo/widgets/toast_msg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:odontologo/widgets/top_menu.dart';
//import 'package:http/http.dart' as http;
import 'package:flutter_dropdown_x/flutter_dropdown_x.dart';
import 'package:flutter_expandable_widget/flutter_expandable_widget.dart';


class Paciente extends StatefulWidget {
  const Paciente({super.key});


  @override
  // ignore: library_private_types_in_public_api
  _PacienteScreen createState() => _PacienteScreen();
}


class _PacienteScreen extends State<Paciente>{

TextEditingController cedulaController = TextEditingController();
TextEditingController nombresController = TextEditingController();
TextEditingController apellidosController = TextEditingController();
TextEditingController correoController = TextEditingController();
TextEditingController fechaNacimientoController = TextEditingController();
TextEditingController edadController = TextEditingController();
TextEditingController direccionController = TextEditingController();
TextEditingController telefonosController = TextEditingController();
TextEditingController generoController = TextEditingController();
int id = 0;

// datos adicionales
ExpandableWidgetController expandableWidgetController = ExpandableWidgetController();
ExpandableWidgetController expandableWidgetController2 = ExpandableWidgetController();
ExpandableWidgetController expandableWidgetController3 = ExpandableWidgetController();

TextEditingController enfermedadesController = TextEditingController();
TextEditingController medicamentoController = TextEditingController();
TextEditingController alergiasController = TextEditingController();
TextEditingController intoleranciasController = TextEditingController();
TextEditingController intervencionesqController = TextEditingController();
TextEditingController habitosToxicosController = TextEditingController();
TextEditingController estadoGeneralController = TextEditingController();


bool isReadOnly = false;
String? _valueGenero;
final List _genero = generos;

RegExp  get _emailRegex => RegExp (r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');

  @override
  void initState() {
    _limpiarVar();
    super.initState();
  }

void _limpiarVar() {
  cedulaController.text='';
  nombresController.text = '';
  apellidosController.text = '';
  correoController.text = '';
  fechaNacimientoController.text = '';
  edadController.text = '';
  direccionController.text = '';
  telefonosController.text = '';
  generoController.text = '0';
  _valueGenero = '';
  id = 0;
  isReadOnly = false;
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: const TopMenuSuperior(title: 'Datos Personales'),
    body: Column(
      children: [
        ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              xl: 2,
              lg: 2,
              md: 4,
              sm: 12,
              xs: 12,
              child: _cedulaPaciente(), 
            ),
            ResponsiveGridCol(
              xl: 5,
              lg: 5,
              md: 4,
              sm: 12,
              xs: 12,
              child: _nombresPaciente(),
            ),
            ResponsiveGridCol(
              xl: 5,
              lg: 5,
              md: 4,
              sm: 12,
              xs: 12,
              child: _direccionPaciente(), 
            ),
          ],
        ),
        
        ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              xl: 5,
              lg: 5,
              md: 4,
              sm: 12,
              xs: 12,
              child: _correoPaciente(),
            ),

            ResponsiveGridCol(
                lg: 2,
                xl: 2,
                md: 3,
                sm: 5,
                xs: 5,
                child: _fechaNacimiento(context)
            ),
                                          //TurnoProduccion
            ResponsiveGridCol(
                lg: 2,
                xl: 2,
                md: 2,
                sm: 2,
                xs: 2,
                child: _edadPaciente()
            ),

            ResponsiveGridCol(
                lg: 3,
                xl: 3,
                md: 3,
                sm: 5,
                xs: 5,
                child: _dropdownButtonGenero()
            ),
        ],
        ),

        ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              xl: 5,
              lg: 5,
              md: 4,
              sm: 12,
              xs: 12,
              child: _telefonoPaciente(),
            ),
          ]
          ),

        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ResponsiveGridRow(
                  children: [
                    ResponsiveGridCol(
                      xl: 12,
                      lg: 12,
                      md: 12,
                      sm: 12,
                      xs: 12,
                      child: listViewExpandableWidget(),
                     ),
                  ]
                
                ),
              ],
            ),
          ),
        ),

      ],
    ),
  );
}

SizedBox listViewExpandableWidget() {
  return SizedBox(
    height: 500.0, // Aumenta la altura según necesidad
    width: MediaQuery.of(context).size.width,
    child: ListView(
            children: [
              antecedentesMedicos(),
              const SizedBox(height: 10),

              antecedentesDentales(),
              const SizedBox(height: 10),

              sintomasActuales(),

            ],
          ),
  );
}

ExpandableWidget sintomasActuales() {
  return ExpandableWidget(
              title: const Text('Síntomas Actuales'),
              decoration: const BoxDecoration(color: Color.fromARGB(255, 202, 207, 209)),
              trailingPosition: TrailingPosition.left,
              trailing: const Icon(Icons.arrow_circle_up_outlined),
              expansionDirection: ExpansionDirection.expandUp,
              controller: expandableWidgetController3,
              children: [
                ResponsiveGridRow(
                  children: [
                    ResponsiveGridCol(
                      xl: 12,
                      lg: 12,
                      md: 12,
                      sm: 12,
                      xs: 12,
                      child: _enfermedadesPaciente(), 
                    ),
                    ResponsiveGridCol(
                      xl: 12,
                      lg: 12,
                      md: 12,
                      sm: 12,
                      xs: 12,
                      child: _medicamentosPaciente(), 
                    ),                  
                    ResponsiveGridCol(
                      xl: 12,
                      lg: 12,
                      md: 12,
                      sm: 12,
                      xs: 12,
                      child: _alergiasPaciente(), 
                    ),                  
                    ResponsiveGridCol(
                      xl: 12,
                      lg: 12,
                      md: 12,
                      sm: 12,
                      xs: 12,
                      child: _intoleraciasPaciente(), 
                    ),                                    
                    ResponsiveGridCol(
                      xl: 12,
                      lg: 12,
                      md: 12,
                      sm: 12,
                      xs: 12,
                      child: _intervencionesPaciente(), 
                    ),                  
                    ResponsiveGridCol(
                      xl: 12,
                      lg: 12,
                      md: 12,
                      sm: 12,
                      xs: 12,
                      child: _habitosToxicosPaciente(), 
                    ),
                    ResponsiveGridCol(
                      xl: 12,
                      lg: 12,
                      md: 12,
                      sm: 12,
                      xs: 12,
                      child: _estadoGeneralPaciente(), 
                    ),

                  ]
                ),
              ],
            );
}

ExpandableWidget antecedentesDentales() {
  return ExpandableWidget(
              title: const Text('Antecedentes Dentales'),
              decoration: const BoxDecoration(color: Color.fromARGB(255, 203, 235, 166)),
              trailingPosition: TrailingPosition.left,
              trailing: const Icon(Icons.arrow_circle_up_outlined),
              controller: expandableWidgetController2,
              children: [
                ResponsiveGridRow(
                  children: [
                    ResponsiveGridCol(
                      xl: 12,
                      lg: 12,
                      md: 12,
                      sm: 12,
                      xs: 12,
                      child: _enfermedadesPaciente(), 
                    ),
                    ResponsiveGridCol(
                      xl: 12,
                      lg: 12,
                      md: 12,
                      sm: 12,
                      xs: 12,
                      child: _medicamentosPaciente(), 
                    ),                  
                    ResponsiveGridCol(
                      xl: 12,
                      lg: 12,
                      md: 12,
                      sm: 12,
                      xs: 12,
                      child: _alergiasPaciente(), 
                    ),                  
                    ResponsiveGridCol(
                      xl: 12,
                      lg: 12,
                      md: 12,
                      sm: 12,
                      xs: 12,
                      child: _intoleraciasPaciente(), 
                    ),                                    
                    ResponsiveGridCol(
                      xl: 12,
                      lg: 12,
                      md: 12,
                      sm: 12,
                      xs: 12,
                      child: _intervencionesPaciente(), 
                    ),                  
                    ResponsiveGridCol(
                      xl: 12,
                      lg: 12,
                      md: 12,
                      sm: 12,
                      xs: 12,
                      child: _habitosToxicosPaciente(), 
                    ),
                    ResponsiveGridCol(
                      xl: 12,
                      lg: 12,
                      md: 12,
                      sm: 12,
                      xs: 12,
                      child: _estadoGeneralPaciente(), 
                    ),

                  ]
                ),
              ],
            );
}

ExpandableWidget antecedentesMedicos() {
  return ExpandableWidget(
              title: const Text('Antecedentes Médicos'),
              decoration: const BoxDecoration(color: Color.fromARGB(255, 193, 228, 245)),
              trailingPosition: TrailingPosition.left,
              trailing: const Icon(Icons.arrow_circle_up_outlined),
              controller: expandableWidgetController,
              children: [
                ResponsiveGridRow(
                  children: [
                    ResponsiveGridCol(
                      xl: 12,
                      lg: 12,
                      md: 12,
                      sm: 12,
                      xs: 12,
                      child: _enfermedadesPaciente(), 
                    ),
                    ResponsiveGridCol(
                      xl: 12,
                      lg: 12,
                      md: 12,
                      sm: 12,
                      xs: 12,
                      child: _medicamentosPaciente(), 
                    ),                  
                    ResponsiveGridCol(
                      xl: 12,
                      lg: 12,
                      md: 12,
                      sm: 12,
                      xs: 12,
                      child: _alergiasPaciente(), 
                    ),                  
                    ResponsiveGridCol(
                      xl: 12,
                      lg: 12,
                      md: 12,
                      sm: 12,
                      xs: 12,
                      child: _intoleraciasPaciente(), 
                    ),                                    
                    ResponsiveGridCol(
                      xl: 12,
                      lg: 12,
                      md: 12,
                      sm: 12,
                      xs: 12,
                      child: _intervencionesPaciente(), 
                    ),                  
                    ResponsiveGridCol(
                      xl: 12,
                      lg: 12,
                      md: 12,
                      sm: 12,
                      xs: 12,
                      child: _habitosToxicosPaciente(), 
                    ),
                    ResponsiveGridCol(
                      xl: 12,
                      lg: 12,
                      md: 12,
                      sm: 12,
                      xs: 12,
                      child: _estadoGeneralPaciente(), 
                    ),

                  ]
                ),
              ],
            );
}

// datos personales
Padding _fechaNacimiento(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: TextFormField(
        controller: fechaNacimientoController,
        readOnly: true,
        keyboardType: TextInputType.datetime,
        validator: (value) {
          return (value != null && value.isNotEmpty)
              ? null
              : 'Debe ingresar una fecha válida';
        },
        onChanged: (value) {
          setState(() {
    
          });
        },
        onTap: () async {
          DateTime? pickedDate =
          await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1950),
              lastDate: DateTime(2050));
    
          if (pickedDate != null) {
            String formattedDate = pickedDate.toString().substring(0,10);
            setState(() {
              fechaNacimientoController.text = formattedDate;
              //_valueFecha = formattedDate;
            });
          } else {
            fechaNacimientoController.clear();
          }
        },
        decoration: InputDecoration(
          labelText: 'Fecha Nacimiento',
          labelStyle: const TextStyle(color: Colors.grey),
          icon: const Icon(Icons.cake_rounded),
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0),),),

        ),
      ),
  );
}

Padding _edadPaciente() {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: TextFormField(
        controller: edadController,
        showCursor: false,
        readOnly: true,
        decoration: InputDecoration(
          labelText: 'Edad',
          labelStyle: const TextStyle(color: Colors.grey),
          //icon: const Icon(Icons.account_box_sharp),
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),),
        ),
        textAlign: TextAlign.right,
        inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
      ),
  );
}

Padding _cedulaPaciente() {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: TextFormField(
        controller: cedulaController,
        showCursor: true,
        maxLength: 10,
        decoration: InputDecoration(
          labelText: 'Cédula',
          counterText: "",
          labelStyle: const TextStyle(color: Colors.grey),
          icon: const Icon(Icons.account_box_sharp),
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),),
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              ToastMSG.showInfo(context, 'Buscando Paciente...', 2);
            },
          ),          
        ),
        textAlign: TextAlign.left,
        validator: (value) {
             final intNumber=int.tryParse(value!);
                  if (value.isEmpty || intNumber! <= 10) {
                    return 'Campo vacio o no es un número Cédula';
                  }
                  return null;
                },
        inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
        onChanged: (value) {

        },
      ),
  );
}

Padding _nombresPaciente() {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: TextFormField(
        controller: nombresController,
        maxLength: 100,
        showCursor: true,
        inputFormatters: <TextInputFormatter>[
              UpperCaseTextFormatter()
            ],
        decoration: InputDecoration(
          labelText: 'Nombres/Apellidos',
          counterText: "",
          labelStyle: const TextStyle(color: Colors.grey),
          icon: const Icon(Icons.co_present_rounded),
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),),
        ),
        textAlign: TextAlign.left,
        onChanged: (value) {

        },
      ),
  );
}

Padding _direccionPaciente() {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: TextFormField(
        controller: direccionController,
        maxLength: 200,
        showCursor: true,
        inputFormatters: <TextInputFormatter>[
              UpperCaseTextFormatter()
            ],
        decoration: InputDecoration(
          labelText: 'Dirección',
          counterText: "",
          labelStyle: const TextStyle(color: Colors.grey),
          icon: const Icon(Icons.home_rounded),
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),),
        ),
        textAlign: TextAlign.left,
        onChanged: (value) {

        },
      ),
  );
}

Padding _correoPaciente() {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: TextFormField(
        controller: correoController,
        maxLength: 100,
        showCursor: true,
        decoration: InputDecoration(
          labelText: 'email',
          counterText: "",
          labelStyle: const TextStyle(color: Colors.grey),
          icon: const Icon(Icons.alternate_email),
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),),
        ),
        textAlign: TextAlign.left,
        validator: (value) {
          if (!_emailRegex.hasMatch(value!)) { 
            ToastMSG.showError(context, 'La dirección de correo electrónico no es válida', 2);
          }
          return null;
        },
        onChanged: (value) {

        },
      ),
  );
}

Padding _dropdownButtonGenero() {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: DropDownField(
      titleText: 'Genero',
      value: edadController.text , //_valueGenero,
      dataSource: _genero,
      onChanged: (value) {
        setState(() {
          generoController.text = value;
          _valueGenero = value;
        });
      },
      textField: 'descripcion',
      valueField: 'codigo',
      hintText: '-- Sin selección --',
    ),
  );
}

Padding _telefonoPaciente() {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: TextFormField(
        controller: telefonosController,
        maxLength: 50,
        showCursor: true,
        inputFormatters: <TextInputFormatter>[
              UpperCaseTextFormatter()
            ],
        decoration: InputDecoration(
          labelText: 'Teléfono(s)',
          counterText: "",
          labelStyle: const TextStyle(color: Colors.grey),
          icon: const Icon(Icons.phonelink_ring),
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),),
        ),
        textAlign: TextAlign.left,
        onChanged: (value) {

        },
      ),
  );
}

// datos antecedentes medicos
Padding _enfermedadesPaciente() {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: TextFormField(
        controller: enfermedadesController,
        maxLength: 200,
        showCursor: true,
        inputFormatters: <TextInputFormatter>[
              UpperCaseTextFormatter()
            ],
        decoration: InputDecoration(
          labelText: 'Enfermedades',
          counterText: "",
          labelStyle: const TextStyle(color: Colors.grey),
          icon: const Icon(Icons.medical_information_outlined),
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),),
        ),
        textAlign: TextAlign.left,
        onChanged: (value) {

        },
      ),
  );
}

Padding _medicamentosPaciente() {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: TextFormField(
        controller: medicamentoController,
        maxLength: 200,
        showCursor: true,
        inputFormatters: <TextInputFormatter>[
              UpperCaseTextFormatter()
            ],
        decoration: InputDecoration(
          labelText: 'Medicamentos que Toma',
          counterText: "",
          labelStyle: const TextStyle(color: Colors.grey),
          icon: const Icon(Icons.medication_liquid_outlined),
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),),
        ),
        textAlign: TextAlign.left,
        onChanged: (value) {

        },
      ),
  );
}

Padding _alergiasPaciente() {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: TextFormField(
        controller: alergiasController,
        maxLength: 200,
        showCursor: true,
        inputFormatters: <TextInputFormatter>[
              UpperCaseTextFormatter()
            ],
        decoration: InputDecoration(
          labelText: 'Alergias',
          counterText: "",
          labelStyle: const TextStyle(color: Colors.grey),
          icon: const Icon(Icons.medication),
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),),
        ),
        textAlign: TextAlign.left,
        onChanged: (value) {

        },
      ),
  );
}

Padding _intoleraciasPaciente() {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: TextFormField(
        controller: intoleranciasController,
        maxLength: 200,
        showCursor: true,
        inputFormatters: <TextInputFormatter>[
              UpperCaseTextFormatter()
            ],
        decoration: InputDecoration(
          labelText: 'Intolerancias',
          counterText: "",
          labelStyle: const TextStyle(color: Colors.grey),
          icon: const Icon(Icons.menu_book_sharp),
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),),
        ),
        textAlign: TextAlign.left,
        onChanged: (value) {

        },
      ),
  );
}

Padding _intervencionesPaciente() {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: TextFormField(
        controller: intervencionesqController,
        maxLength: 200,
        showCursor: true,
        inputFormatters: <TextInputFormatter>[
              UpperCaseTextFormatter()
            ],
        decoration: InputDecoration(
          labelText: 'Intervenciones Quirúrgicas',
          counterText: "",
          labelStyle: const TextStyle(color: Colors.grey),
          icon: const Icon(Icons.local_hospital_outlined),
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),),
        ),
        textAlign: TextAlign.left,
        onChanged: (value) {

        },
      ),
  );
}

Padding _habitosToxicosPaciente() {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: TextFormField(
        controller: habitosToxicosController,
        maxLength: 200,
        showCursor: true,
        inputFormatters: <TextInputFormatter>[
              UpperCaseTextFormatter()
            ],
        decoration: InputDecoration(
          labelText: 'Hábitos Tóxicos',
          counterText: "",
          labelStyle: const TextStyle(color: Colors.grey),
          icon: const Icon(Icons.crisis_alert),
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),),
        ),
        textAlign: TextAlign.left,
        onChanged: (value) {

        },
      ),
  );
}

Padding _estadoGeneralPaciente() {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: TextFormField(
        controller: estadoGeneralController,
        maxLength: 200,
        showCursor: true,
        inputFormatters: <TextInputFormatter>[
              UpperCaseTextFormatter()
            ],
        decoration: InputDecoration(
          labelText: 'Estado General de Salud',
          counterText: "",
          labelStyle: const TextStyle(color: Colors.grey),
          icon: const Icon(Icons.monitor_heart_outlined),
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),),
        ),
        textAlign: TextAlign.left,
        onChanged: (value) {

        },
      ),
  );
}

// datos antecedentes dentales





}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: uppercase(newValue.text),
      selection: newValue.selection,
    );
  }
}

String uppercase(String value) {
  if(value.trim().isEmpty) return "";
  //return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
  return value.toUpperCase();
}