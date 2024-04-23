import 'package:http/http.dart' as http;

class Services {
  static Future<String?> obtenerHtmlDesdeEnlace(String placa) async {
    // Enlace base con la placa como parámetro
    String enlaceBase =
        'https://consultaweb.ant.gob.ec/PortalWEB/paginas/clientes/clp_grid_citaciones.jsp?ps_tipo_identificacion=PLA&ps_identificacion=$placa&ps_placa=';

    try {
      // Realizar la solicitud HTTP para obtener el HTML de la página web
      http.Response response = await http.get(Uri.parse(enlaceBase));

      if (response.statusCode == 200) {
        // Si la solicitud es exitosa, retornar el HTML de la respuesta
        return response.body;
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error al realizar la solicitud HTTP: $e');
      return null;
    }
  }
}
