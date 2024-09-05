import 'dart:convert';
import 'package:http/http.dart' as http;
import 'librery.dart';

void main() async {
  List<User> users = await fetchUsers();
  if (users.isEmpty) {
    print('No hay usuarios');
  } else {
    print('hola');
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
