import 'dart:convert';
import 'package:http/http.dart' as http;
import 'librery.dart';

void main() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
  var response = await http.get(url);

  print(response);

  if (response.statusCode != 200) {
    print('Error al obtener los datos: ${response.statusCode}');
  } else {
    print('Datos obtenidos correctamente');
    List<dynamic> jsonData = json.decode(response.body);
    List<User> users = jsonData.map((json) => User.datosJson(json)).toList();

    users.forEach((user) => user.imprimirUser());
  }

}
