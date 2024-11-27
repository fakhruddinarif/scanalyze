import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scanalyze_app/utils/local_storage/local_storage.dart';

class ScanalyzeHttpClient {
  static const String _baseUrl = 'http://10.0.2.2:8000/api';

  static Future<Map<String, dynamic>> get(String endpoint) async {
    final headers = await _getHeaders();
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'), headers: headers);
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> post(String endpoint, dynamic body) async {
    final headers = await _getHeaders();
    final response = await http.post(Uri.parse('$_baseUrl/$endpoint'), headers: headers, body: json.encode(body));
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> multipartPost(String endpoint, Map<String, dynamic> body) async {
    final headers = await _getHeaders();
    final request = http.MultipartRequest('POST', Uri.parse('$_baseUrl/$endpoint'));
    request.headers.addAll(headers);
    body.forEach((key, value) {
      if (value is http.MultipartFile) {
        request.files.add(value);
      } else {
        request.fields[key] = value;
      }
    });
    final response = await request.send();
    final responseString = await response.stream.bytesToString();
    return _handleResponse(http.Response(responseString, response.statusCode));
  }

  static Future<Map<String, dynamic>> put(String endpoint, dynamic body) async {
    final headers = await _getHeaders();
    final response = await http.put(Uri.parse('$_baseUrl/$endpoint'), headers: headers, body: json.encode(body));
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> multipartPut(String endpoint, Map<String, dynamic> body) async {
    final headers = await _getHeaders();
    final request = http.MultipartRequest('PUT', Uri.parse('$_baseUrl/$endpoint'));
    request.headers.addAll(headers);
    body.forEach((key, value) {
      if (value is http.MultipartFile) {
        request.files.add(value);
      } else {
        request.fields[key] = value;
      }
    });
    final response = await request.send();
    final responseString = await response.stream.bytesToString();
    return _handleResponse(http.Response(responseString, response.statusCode));
  }

  static Future<Map<String, dynamic>> patch(String endpoint, dynamic body) async {
    final headers = await _getHeaders();
    final response = await http.patch(Uri.parse('$_baseUrl/$endpoint'), headers: headers, body: json.encode(body));
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> multipartPatch(String endpoint, Map<String, dynamic> body) async {
    final headers = await _getHeaders();
    final request = http.MultipartRequest('PATCH', Uri.parse('$_baseUrl/$endpoint'));
    request.headers.addAll(headers);
    body.forEach((key, value) {
      if (value is http.MultipartFile) {
        request.files.add(value);
      } else {
        request.fields[key] = value;
      }
    });
    final response = await request.send();
    final responseString = await response.stream.bytesToString();
    return _handleResponse(http.Response(responseString, response.statusCode));
  }

  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final headers = await _getHeaders();
    final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'), headers: headers);
    return _handleResponse(response);
  }

  static Future<Map<String, String>> _getHeaders() async {
    final token = await ScanalyzerLocalStorage().read<String>('access_token');
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // Handle the HTTP response
  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.body}');
    }
  }
}