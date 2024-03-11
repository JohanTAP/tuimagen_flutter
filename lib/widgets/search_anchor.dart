import 'package:flutter/material.dart';
import 'package:tuimagen_flutter/services/servicio_sugerencias.dart';

class MiAnclaDeBusqueda extends StatefulWidget {
  const MiAnclaDeBusqueda({super.key});

  @override
  _MiAnclaDeBusquedaEstado createState() => _MiAnclaDeBusquedaEstado();
}

class _MiAnclaDeBusquedaEstado extends State<MiAnclaDeBusqueda> {
  final TextEditingController _controladorBusqueda = TextEditingController();
  List<String> _sugerencias = [];
  bool _mostrarIconoBorrar = false;
  bool _mostrarError = false;

  void _obtenerSugerencias(String consulta) async {
    try {
      final sugerencias =
          await ServicioDeSugerencias.obtenerSugerencias(consulta);
      setState(() {
        _sugerencias = sugerencias;
        _mostrarError = _sugerencias.isEmpty;
      });
    } catch (e) {
      print('Error al obtener sugerencias: $e');
      setState(() {
        _mostrarError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controladorBusqueda,
              onChanged: (consulta) {
                setState(() {
                  _mostrarIconoBorrar = consulta.isNotEmpty;
                  _mostrarError =
                      false; // Reinicia el estado de error al cambiar la consulta
                });
                _obtenerSugerencias(consulta);
              },
              decoration: InputDecoration(
                labelText: 'Buscar',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                errorText:
                    _mostrarError ? 'No se encontraron sugerencias' : null,
                suffixIcon: _mostrarIconoBorrar
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _controladorBusqueda.clear();
                          setState(() {
                            _mostrarIconoBorrar = false;
                            _sugerencias.clear();
                            _mostrarError =
                                false; // Limpia el error al borrar el texto
                          });
                        },
                      )
                    : null,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: _sugerencias.length,
              itemBuilder: (contexto, indice) {
                return ListTile(
                  title: Text(_sugerencias[indice]),
                  onTap: () {
                    ScaffoldMessenger.of(contexto).showSnackBar(
                      SnackBar(
                        content:
                            Text('Seleccionaste a: ${_sugerencias[indice]}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
