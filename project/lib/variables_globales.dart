
String baseUrl = 'https://localhost:7000';

//String baseUrl = 'https://backendconsultorio.onrender.com/';

String usuario = 'usuario';
String clave = "clave";
String userValido = '0';

String token = 'token';
String fechaValidaToken = '';

String version = '1';

var map = {
    'Accept': '*/*',
    'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
    'Content-Type': 'application/json',
    'Access-Control-Allow-Origin': '*', // Add this header
    'Access-Control-Allow-Credentials': 'true', // Required for cookies, authorization headers with HTTPS
    'Access-Control-Allow-Headers': 'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale',
  };

//Lista de Generos
List generos = [{'codigo': '0', 'descripcion': ' -- Sin Selección --'},{'codigo': '1', 'descripcion': 'Masculino'},{'codigo': '2', 'descripcion': 'Femenino'}];
