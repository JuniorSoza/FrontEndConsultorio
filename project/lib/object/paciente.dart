import 'package:json_annotation/json_annotation.dart';

part 'paciente.g.dart';

@JsonSerializable()
class Paciente {
  // Datos personales
  final String id;
  final String cedula;
  final String nombreCompleto;
  final String fechaNacimiento; // ISO 8601 string
  final int edad;
  final String direccion;
  final String telefono;
  final String sexo;

  // Antecedentes médicos
  final List<String> enfermedades;
  final List<String> medicamentos;
  final List<String> alergias;
  final List<String> intolerancias;
  final List<String> intervencionesQuirurgicas;
  final List<String> habitosToxicos;
  final String estadoGeneralSalud;

  // Antecedentes dentales
  final String habitosDieteticosHigienicos;
  final String doloresOrofacialesATM;
  final String traumatismosDentalesMaxilares;
  final String tratamientosPrevios;
  final String patologiaDentalGingival;
  final String frecuenciaVisitas;
  final String problemasDentalesRecurrentes;

  // Síntomas actuales
  final bool sangrado;
  final bool dolor;
  final bool maloclusion;
  final bool proliferacionesNuevas;
  final bool entumecimientoParestencias;
  final bool problemasEnLaMasticacion;

  Paciente({
    required this.id,
    required this.cedula,
    required this.nombreCompleto,
    required this.fechaNacimiento,
    required this.edad,
    required this.direccion,
    required this.telefono,
    required this.sexo,
    required this.enfermedades,
    required this.medicamentos,
    required this.alergias,
    required this.intolerancias,
    required this.intervencionesQuirurgicas,
    required this.habitosToxicos,
    required this.estadoGeneralSalud,
    required this.habitosDieteticosHigienicos,
    required this.doloresOrofacialesATM,
    required this.traumatismosDentalesMaxilares,
    required this.tratamientosPrevios,
    required this.patologiaDentalGingival,
    required this.frecuenciaVisitas,
    required this.problemasDentalesRecurrentes,
    required this.sangrado,
    required this.dolor,
    required this.maloclusion,
    required this.proliferacionesNuevas,
    required this.entumecimientoParestencias,
    required this.problemasEnLaMasticacion
  });

  factory Paciente.fromJson(Map<String, dynamic> json) => _$PacienteFromJson(json);
  Map<String, dynamic> toJson() => _$PacienteToJson(this);
}
