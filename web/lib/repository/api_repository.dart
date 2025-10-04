import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiRepository {
  final String baseUrl;
  String? _token;
  ApiRepository(this.baseUrl);

  set token(String? t) => _token = t;

  Map<String, String> get _headers => {
    'Content-Type': 'application/json',
    if (_token != null) 'Authorization': 'Bearer $_token',
  };

  Future<Map<String, dynamic>> register({required String name, required String baptismalName, required String phone}) async {
    final r = await http.post(Uri.parse('$baseUrl/auth/register'),
        headers: _headers,
        body: jsonEncode({'name': name, 'baptismal_name': baptismalName, 'phone': phone}));
    return jsonDecode(r.body);
  }

  Future<Map<String, dynamic>> login({required String name, required String baptismalName}) async {
    final r = await http.post(Uri.parse('$baseUrl/auth/login'),
        headers: _headers,
        body: jsonEncode({'name': name, 'baptismal_name': baptismalName}));
    final data = jsonDecode(r.body);
    _token = data['token'];
    return data;
  }

  Future<Map<String, dynamic>> fetchMassToday() async {
    final r = await http.get(Uri.parse('$baseUrl/mass/today'), headers: _headers);
    return jsonDecode(r.body);
  }

  Future<Map<String, dynamic>> fetchVisitorCountToday() async {
    final r = await http.get(Uri.parse('$baseUrl/stats/visitors/today'), headers: _headers);
    return jsonDecode(r.body);
  }

  Future<Map<String, dynamic>> fetchMyAttendance() async {
    final r = await http.get(Uri.parse('$baseUrl/attendance/me'), headers: _headers);
    return jsonDecode(r.body);
  }

  Future<Map<String, dynamic>> verifyCode(String code) async {
    final r = await http.post(Uri.parse('$baseUrl/attendance/verify'), headers: _headers, body: jsonEncode({'code': code}));
    return jsonDecode(r.body);
  }

  Future<Map<String, dynamic>> fetchNotice() async {
    final r = await http.get(Uri.parse('$baseUrl/notice/today'), headers: _headers);
    return jsonDecode(r.body);
  }
}
