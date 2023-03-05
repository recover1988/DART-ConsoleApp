import 'package:http/http.dart' as http;

import 'package:paquetes/classes/pais.dart';
// import 'package:paquetes/classes/reqres_respuesta.dart';

// void getReqRes_service() {
//   final url = Uri.parse('https://reqres.in/api/users?page=2');
//   // final url = Uri.https('reqres.in', 'api/users?page=2');
//   // final response = await http.get(url);
//   // print(jsonDecode(response.body));

//   http.get(url).then((res) {
//     final resReqRes = reqResRespuestaFromJson(res.body);
//     // print(res.statusCode);
//     // final body = jsonDecode(res.body);
//     // print('page: ${body['page']}');
//     // print('per_page:  ${body['per_page']}');
//     // print('id del tercer elemento:  ${body['data'][2]['id']}');

//     print('page: ${resReqRes.page}');
//     print('per_page:  ${resReqRes.perPage}');
//     print('id del tercer elemento:  ${resReqRes.data[2].id}');
//   });
// }

// Tarea

void getPaisService() {
  final url2 = Uri.parse('https://restcountries.com/v3.1/alpha/col');

  http.get(url2).then((res) {
    final paises = paisFromJson(res.body);
    print('Pais: ${paises[0].name.common}');
    print('Poblacion: ${paises[0].population}');
    print('Fronteras:');
    newMethod(paises);
    print('Leguajes: ${paises[0].languages.spa}');
    print('Latitud: ${paises[0].latlng[0]}');
    print('Longitud: ${paises[0].latlng[1]}');
    print('Moneda: ${paises[0].currencies.cop.name}');
    print('Bandera: ${paises[0].flags.svg}');
  }).catchError((err) => print(err));
}

void newMethod(List<Pais> paises) =>
    paises[0].borders.forEach((f) => print('         $f'));
