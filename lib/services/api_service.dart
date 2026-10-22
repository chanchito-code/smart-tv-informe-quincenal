import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Configura la URL del backend al ejecutar la app:
  // flutter run --dart-define=API_BASE_URL=http://192.168.1.50:8000/api
  //
  // Valores por defecto:
  // - Emulador Android local: 'http://10.0.2.2:8000/api'
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://10.0.2.2:8000/api',
  );

  // 1. Obtener listado de Acuses
  static Future<List<dynamic>> fetchAcuses() async {
    final response = await http.get(Uri.parse('$baseUrl/acuses'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al cargar acuses: ${response.statusCode}');
    }
  }

  // 2. Obtener Servidores Públicos Sancionados
  static Future<List<dynamic>> fetchServidoresPublicos() async {
    final response = await http.get(Uri.parse('$baseUrl/servidores-publicos'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al cargar servidores públicos');
    }
  }
}
