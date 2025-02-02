import 'dart:convert';

import 'package:football_app/models/football_model.dart';
import 'package:http/http.dart';

class FootballApi{

  final String url = 'https://v3.football.api-sports.io/fixtures?live=all';

  var headers = {
    'x-rapidapi-key': '',//your API key
    'x-rapidapi-host': 'v3.football.api-sports.io'
  };


  Future<List<FootballMatch>> getMatch() async {
    Response response = await get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      List<dynamic> matchList = body['response'];

      print('API Service: $body'); // Print full response for debugging.

      List<FootballMatch> matches = matchList
          .map((dynamic item) => FootballMatch.fromJson(item))
          .toList();

      print('Parsed Matches: $matches'); // Check parsed matches.

      return matches;
    } else {
      print('Error: Failed to fetch matches. Status Code: ${response.statusCode}');
      print('Response body: ${response.body}');
      return [];
    }
  }

}
