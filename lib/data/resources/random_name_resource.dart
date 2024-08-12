import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:name_generator/data/models/random_name_model.dart';

class RandomNameResource {
  Future<RandomName> fetchRandomName() async {
    final response = await http.get(Uri.parse('https://randomuser.me/api/'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return RandomName.fromJson(jsonData['results'][0]);
    } else {
      throw Exception('Failed to load random name');
    }
  }
}