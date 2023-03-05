A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

## Paquetes

### PUB.DEV

```
https://pub.dev/
```

En esta pagina estans todos los paquetes que se pueden instalar en dart y flutter.

Para instalar un paquete podemos ir al archivo `pubspec.yaml` que es como el 'package.json' en node, e instalar las dependencias.

```
name: paquetes
description: A sample command-line application.
version: 1.0.0
# repository: https://github.com/my_org/my_repo

environment:
  sdk: ">=2.19.2 <3.0.0"

# dependencies:
#   path: ^1.8.0

dev_dependencies:
  lints: ^2.0.0
  test: ^1.21.0
  http: ^0.13.5

```

Una vez puesto en el archivo dart instala la dependencias de no hacerlo automaticamente podemos usar el comando:

```
pub get
```

Para eliminarlo podemos quitarlos del archivo y volvel a usar

```
pub get
```

para que se actualize.

## Importar

Para usar los paquetes en un archivo dart tenemos que importarlos:

```
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:paquetes/paquetes.dart' as paquetes;

```

Se recomienda ordenar los imports de ka siguiente forma:
1- Los imports de dart.
2- Las librearias de terceros
3- Los elementos creados por nosotros como clases, funciones, etc.

## Estructura de proyectos

Los proyectos tiene 3 carpetas especificas, que son:

- `bin` que es donde esta el main de la funcion.
- `lib` las funciones.
- `test` donde se realizan las pruebas

## Qué subir a un repositorio

## Paquete Http

El paquete `Http` sirve para hacer request a api con los metodos conocidos como `CRUD`, y nos da control sobre la respuesta.

```
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

```

## Mapear datos de respuesta

Para obtener los datos de la respuesta lo mejor es usar:

```
https://app.quicktype.io/
```

Marcamos la opcion de `Dart` y `Null Safety`.

Creamos una nueva carpeta dentro de `lib` que diga `classes` y pegamo el codigo. Si necesitamos reutilizar alguna clase de esta respuesta lo mejor es sacarlo a otro archivos y importalo.

```
// classes/reqres_respuesta.dart

import 'dart:convert';

import 'persona.dart';

ReqResRespuesta reqResRespuestaFromJson(String str) =>
    ReqResRespuesta.fromJson(json.decode(str));

String reqResRespuestaToJson(ReqResRespuesta data) =>
    json.encode(data.toJson());

class ReqResRespuesta {
  ReqResRespuesta({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  int page;
  int perPage;
  int total;
  int totalPages;
  List<Persona> data;
  Support support;

  factory ReqResRespuesta.fromJson(Map<String, dynamic> json) =>
      ReqResRespuesta(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: List<Persona>.from(json["data"].map((x) => Persona.fromJson(x))),
        support: Support.fromJson(json["support"]),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "support": support.toJson(),
      };
}

class Support {
  Support({
    required this.url,
    required this.text,
  });

  String url;
  String text;

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };
}

```

Como se puede observar estamos importando la clase Persona de otro archivo debido a que queremos reutilizar la clase de Persona.

```
// classes/persona.dart

import 'dart:convert';

Persona personaFromJson(String str) => Persona.fromJson(json.decode(str));

String personaToJson(Persona data) => json.encode(data.toJson());

class Persona {
  Persona({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  factory Persona.fromJson(Map<String, dynamic> json) => Persona(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}

```

## Optimizaciones

Para optimizar el codigo lo mejor es pasar la logia a otra funcion dentro de `lib` de esta forma en el `main` solo invocamos la funcion y asi nuestro codigo es mas facil de leer.
