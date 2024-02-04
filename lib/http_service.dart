import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpService {
  static const String baseUrl = 'http://localhost:8080/api';

  static Future<String> getUser(int id) async {
    String url = '$baseUrl/getUser';
    Map<String, dynamic> jsonData = {'id': id};
    String jsonString = jsonEncode(jsonData);

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonString,
      );

      return response.body;
    } catch (e) {
      return 'Error: $e';
    }
  }

  static Future<String> insertUser(int id, String name, String address) async {
    String url = '$baseUrl/insertUser';
    Map<String, dynamic> jsonData = {'id': id, 'name': name, 'address': address};
    String jsonString = jsonEncode(jsonData);

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonString,
      );

      if (response.statusCode == 200) {
        return 'Success';
      } else {
        return 'Error: ${response.statusCode}, ${response.body}';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}
