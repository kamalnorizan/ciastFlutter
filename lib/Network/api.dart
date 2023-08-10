import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  final String _url = 'http://restapi.adequateshop.com';

  authaccount(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
    );
  }
}
