import 'package:scanalyze_app/models/user.dart';
import 'package:scanalyze_app/utils/http/http_client.dart';

class UserController {
  Future<Map<String, dynamic>> register(RegisterUserRequest request) async {
    try {
      final response = await ScanalyzeHttpClient.post("register", request.toJson());
      if (response['data'] != null) {
        return response;
      } else {
        throw Exception(response['message']);
      }
    }
    catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Map<String, dynamic>> login(LoginUserRequest request) async {
    try {
      final response = await ScanalyzeHttpClient.post("login", request.toJson());
      if (response['data'] != null) {
        return response;
      } else {
        throw Exception(response['message']);
      }
    }
    catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Map<String, dynamic>> update(UpdateUserRequest request) async {
    try {
      final response = await ScanalyzeHttpClient.put("user", request.toJson());
      if (response['data'] != null) {
        return response;
      } else {
        throw Exception(response['message']);
      }
    }
    catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Map<String, dynamic>> delete(String id) async {
    try {
      final response = await ScanalyzeHttpClient.delete("user");
      if (response['data'] != null) {
        return response;
      } else {
        throw Exception(response['message']);
      }
    }
    catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Map<String, dynamic>> get() async {
    try {
      final response = await ScanalyzeHttpClient.get("user");
      if (response['data'] != null) {
        return response;
      } else {
        throw Exception(response['message']);
      }
    }
    catch (e) {
      throw Exception(e.toString());
    }
  }
}