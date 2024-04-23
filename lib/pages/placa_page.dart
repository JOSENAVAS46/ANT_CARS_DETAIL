import 'package:ant_cars_details/models/car_model.dart';
import 'package:ant_cars_details/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlacaPage extends StatefulWidget {
  @override
  _PlacaPageState createState() => _PlacaPageState();
}

class _PlacaPageState extends State<PlacaPage> {
  String licensePlate = '';
  String carDetails = '';
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BUSCAR POR PLACA'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Ingrese la PLACA del Vehiculo:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              onChanged: (value) {
                setState(() {
                  _controller.text = value.toUpperCase();
                  licensePlate = value.toUpperCase();
                });
              },
              decoration: const InputDecoration(
                hintText: 'ABC1234',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Llamar al método para obtener la información del vehículo
                final html =
                    await Services.obtenerHtmlDesdeEnlace(licensePlate);
                final carro = Car.fromHtml(html!);
                if (carro != null) {
                  setState(() {
                    carDetails = '''
          Placa: ${carro.plate}
          Marca: ${carro.marca}
          Modelo: ${carro.modelo}
          Color: ${carro.color}
          Año de Matrícula: ${carro.anoMatricula}
          Clase: ${carro.clase}
          Fecha de Matrícula: ${carro.fechaMatricula}
          Año: ${carro.ano}
          Servicio: ${carro.servicio}
          Fecha de Caducidad: ${carro.fechaCaducidad}
          Polarizado: ${carro.polarizado}
        ''';
                  });
                } else {
                  setState(() {
                    carDetails =
                        'No se encontró información para la placa $licensePlate';
                  });
                }
              },
              child: const Text('Buscar'),
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  carDetails,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
