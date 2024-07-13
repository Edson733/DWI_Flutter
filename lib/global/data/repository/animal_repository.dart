import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/animal_model.dart';

class AnimalRepository {
  final String apiUrl;
  final String accessToken;

  AnimalRepository({required this.apiUrl, required this.accessToken});

  Future<void> createAnimal(AnimalModel animal) async {
    final response = await http.post(
      Uri.parse('$apiUrl/animals'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(animal.toJson()..remove('id')),
    );

    if (response.statusCode == 200) { //Se lanza excepción que la va a consumir cubit, el cual va a manejar los estados
      print('Animal created successfully');
    } else {
      throw Exception('Failed to create animal');
    }
  }

  Future<AnimalModel> getAnimal(String id) async {
    final response = await http.get(
      Uri.parse('$apiUrl/animals/$id'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      return AnimalModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get animal');
    }
  }

  Future<void> updateAnimal(AnimalModel animal) async {
    final response = await http.put(
      Uri.parse('$apiUrl/animals'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(animal.toJson()),
    );

    if (response.statusCode == 200) {
      print('Animal updated successfully');
    } else {
      throw Exception('Failed to update animal');
    }
  }

  Future<void> deleteAnimal(String id) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/animals/$id'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      print('Animal deleted successfully');
    } else {
      throw Exception('Failed to delete animal');
    }
  }

  Future<List<AnimalModel>> getAllAnimals() async {
    final response = await http.get(
      Uri.parse('$apiUrl/animals'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List<dynamic>)
         .map((e) => AnimalModel.fromJson(e as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Failed to get all animals');
    }
  }
}