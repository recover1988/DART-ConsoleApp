import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:paquetes/paquetes.dart' as paquetes;

void main(List<String> arguments) async {
  final url = Uri.parse('https://reqres.in/api/users?page=2');
  // final url = Uri.https('reqres.in', 'api/users?page=2');
  // final response = await http.get(url);
  // print(jsonDecode(response.body));

  http.get(url).then((res) {
    // print(res.statusCode);
    final body = jsonDecode(res.body);
    print('page: ${body['page']}');
    print('per_page:  ${body['per_page']}');
    print('id del tercer elemento:  ${body['data'][2]['id']}');
  });
}
