import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

class Car {
  String plate;
  String marca;
  String modelo;
  String color;
  String anoMatricula;
  String clase;
  String fechaMatricula;
  String ano;
  String servicio;
  String fechaCaducidad;
  String polarizado;

  Car({
    required this.plate,
    required this.marca,
    required this.modelo,
    required this.color,
    required this.anoMatricula,
    required this.clase,
    required this.fechaMatricula,
    required this.ano,
    required this.servicio,
    required this.fechaCaducidad,
    required this.polarizado,
  });

  factory Car.fromHtml(String html) {
    final document = parser.parse(html);
    final elements = document.querySelectorAll('.tabla_1 td');

    return Car(
      plate: elements[0].text.trim(),
      marca: elements[2].text.trim(),
      modelo: elements[5].text.trim(),
      color: elements[7].text.trim(),
      anoMatricula: elements[9].text.trim(),
      clase: elements[12].text.trim(),
      fechaMatricula: elements[14].text.trim(),
      ano: elements[17].text.trim(),
      servicio: elements[19].text.trim(),
      fechaCaducidad: elements[22].text.trim(),
      polarizado: elements[24].text.trim(),
    );
  }
}

Car obtenerInfoCarroDesdeTexto(String texto) {
  return Car.fromHtml(texto);
}
