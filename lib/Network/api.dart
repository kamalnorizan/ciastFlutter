import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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

  httpRequestWithHeader(apiUrl) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String _token = localStorage.getString('token')!;

    Map<String, String> headers = {
      'Authorization': 'Bearer $_token',
    };

    var fullUrl = _url + apiUrl;
    return await http.get(Uri.parse(fullUrl), headers: headers);
  }
}
