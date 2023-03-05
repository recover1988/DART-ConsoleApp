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

## Optimizaciones
