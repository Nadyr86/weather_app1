import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:weather_app1/utils/constants/texts/app_texts.dart';

// get

class HttpUtil {
  static Future<Map<String, dynamic>> get(
    String endpoint, {
    Object body,
    Map<String, String> headers,
  }) async {
    var client = http.Client();
    final _url = AppTexts.baseUrl + endpoint;

    try {
      Uri _uri = Uri.parse(_url);

      final response = await client.get(_uri);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = response.body;

        return convert.json.decode(body) as Map<String, dynamic>;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // post

  static Future<Map<String, dynamic>> post({
    String url,
    Object body,
    Map<String, String> headers,
  }) async {
    var client = http.Client();
    try {
      Uri _uri = Uri.parse(url);

      final response = await client.post(_uri);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = response.body;

        return convert.json.decode(body) as Map<String, dynamic>;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // delete

  static Future<Map<String, dynamic>> delete({
    String url,
    Object body,
    Map<String, String> headers,
  }) async {
    var client = http.Client();
    try {
      Uri _uri = Uri.parse(url);

      final response = await client.delete(_uri);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = response.body;

        return convert.json.decode(body) as Map<String, dynamic>;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // put update

  static Future<Map<String, dynamic>> put({
    String url,
    Object body,
    Map<String, String> headers,
  }) async {
    var client = http.Client();
    try {
      Uri _uri = Uri.parse(url);

      final response = await client.put(_uri);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = response.body;

        return convert.json.decode(body) as Map<String, dynamic>;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
