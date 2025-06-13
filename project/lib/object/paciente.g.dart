// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paciente.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Paciente _$PacienteFromJson(Map<String, dynamic> json) => Paciente(
  id: json['id'] as String,
  cedula: json['cedula'] as String,
  nombreCompleto: json['nombreCompleto'] as String,
  fechaNacimiento: json['fechaNacimiento'] as String,
  edad: (json['edad'] as num).toInt(),
  direccion: json['direccion'] as String,
  telefono: json['telefono'] as String,
  sexo: json['sexo'] as String,
  enfermedades: (json['enfermedades'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  medicamentos: (json['medicamentos'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  alergias: (json['alergias'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  intolerancias: (json['intolerancias'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  intervencionesQuirurgicas:
      (json['intervencionesQuirurgicas'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
  habitosToxicos: (json['habitosToxicos'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  estadoGeneralSalud: json['estadoGeneralSalud'] as String,
  habitosDieteticosHigienicos: json['habitosDieteticosHigienicos'] as String,
  doloresOrofacialesATM: json['doloresOrofacialesATM'] as String,
  traumatismosDentalesMaxilares:
      json['traumatismosDentalesMaxilares'] as String,
  tratamientosPrevios: json['tratamientosPrevios'] as String,
  patologiaDentalGingival: json['patologiaDentalGingival'] as String,
  frecuenciaVisitas: json['frecuenciaVisitas'] as String,
  problemasDentalesRecurrentes: json['problemasDentalesRecurrentes'] as String,
  sangrado: json['sangrado'] as bool,
  dolor: json['dolor'] as bool,
  maloclusion: json['maloclusion'] as bool,
  proliferacionesNuevas: json['proliferacionesNuevas'] as bool,
  entumecimientoParestencias: json['entumecimientoParestencias'] as bool,
  problemasEnLaMasticacion: json['problemasEnLaMasticacion'] as bool,
);

Map<String, dynamic> _$PacienteToJson(Paciente instance) => <String, dynamic>{
  'id': instance.id,
  'cedula': instance.cedula,
  'nombreCompleto': instance.nombreCompleto,
  'fechaNacimiento': instance.fechaNacimiento,
  'edad': instance.edad,
  'direccion': instance.direccion,
  'telefono': instance.telefono,
  'sexo': instance.sexo,
  'enfermedades': instance.enfermedades,
  'medicamentos': instance.medicamentos,
  'alergias': instance.alergias,
  'intolerancias': instance.intolerancias,
  'intervencionesQuirurgicas': instance.intervencionesQuirurgicas,
  'habitosToxicos': instance.habitosToxicos,
  'estadoGeneralSalud': instance.estadoGeneralSalud,
  'habitosDieteticosHigienicos': instance.habitosDieteticosHigienicos,
  'doloresOrofacialesATM': instance.doloresOrofacialesATM,
  'traumatismosDentalesMaxilares': instance.traumatismosDentalesMaxilares,
  'tratamientosPrevios': instance.tratamientosPrevios,
  'patologiaDentalGingival': instance.patologiaDentalGingival,
  'frecuenciaVisitas': instance.frecuenciaVisitas,
  'problemasDentalesRecurrentes': instance.problemasDentalesRecurrentes,
  'sangrado': instance.sangrado,
  'dolor': instance.dolor,
  'maloclusion': instance.maloclusion,
  'proliferacionesNuevas': instance.proliferacionesNuevas,
  'entumecimientoParestencias': instance.entumecimientoParestencias,
  'problemasEnLaMasticacion': instance.problemasEnLaMasticacion,
};
