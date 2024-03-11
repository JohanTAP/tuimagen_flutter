import 'package:http/http.dart' as http;
import 'dart:convert';

class ServicioDeSugerencias {
  static Future<List<String>> obtenerSugerencias(String consulta) async {
    if (consulta.isEmpty) {
      // Si la consulta está vacía, no se realizan solicitudes y se devuelve una lista vacía
      return [];
    }

    try {
      final response = await http.get(
        Uri.parse(
            'http://192.168.1.161:8080/api/orden?nombre_paciente=$consulta'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> ordenes = jsonDecode(response.body)['data'];
        final sugerencias = ordenes
            .map<String>(
                (orden) => orden['paciente']['nombres_paciente'] as String)
            .toList();

        if (sugerencias.isNotEmpty) {
          // Filtrar sugerencias para mostrar solo las que comienzan con la consulta
          sugerencias.retainWhere((sugerencia) =>
              sugerencia.toLowerCase().startsWith(consulta.toLowerCase()));

          return sugerencias;
        } else {
          // No se encontraron sugerencias
          return [];
        }
      } else {
        // La solicitud falló
        throw Exception('Fallo al cargar las sugerencias');
      }
    } catch (e) {
      // Error de conexión u otro error
      print('Error: $e');
      throw Exception('Error al conectar con el servidor');
    }
  }
}
