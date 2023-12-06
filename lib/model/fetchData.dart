import 'dart:convert';

import 'package:artifia_quiz_app/model/quiz_Data.dart';
import 'package:http/http.dart' as http;

Future<List<QuizData>> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://nice-lime-hippo-wear.cyclic.app/api/v1/quiz'));
      print(response.body);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return  quizDataFromJson((response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
