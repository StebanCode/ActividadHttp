import 'dart:convert';
import 'package:http/http.dart' as http;
import 'librery.dart';

void main() async {
  List<User> users = await fetchUsers();
  if (users.isEmpty) {
    print('No hay usuarios');
  } else {
    filtroUser(users);
    print("------------------------------------------");
    filtroCorreo(users);
  }
}
Future<List<User>> fetchUsers() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    List<User> users = (json.decode(response.body) as List)
        .map((data) => User.fromJson(data))
        .toList();
    return users;
  } else {
    print('Error: al obtener los usuarios. ${response.statusCode}');
    return [];
  }
}

void filtroUser(List<User> users) {
  var user = users.where((user) => user.name.length > 6).toList();
  user.forEach((element)=> element.imprimirUser());
}

void filtroCorreo(List<User> users) {
  var user = users.where((user) => user.email.contains('biz')).toList();
  print('Numero de usuarios con correo que pertenecen al dominio "biz": ${user.length}');
  user.forEach((element)=> element.imprimirUser());
}
