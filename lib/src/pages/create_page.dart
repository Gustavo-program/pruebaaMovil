import 'package:cl3_marianoroman/src/models/servicioBe_model.dart';
import 'package:cl3_marianoroman/src/providers/service_provider.dart';
import 'package:cl3_marianoroman/src/utils/notify.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePage extends StatelessWidget {

  final cliente = new TextEditingController();
  final orden = new TextEditingController();
  final fecha = new TextEditingController();
  final linea = new TextEditingController();
  final estado = new TextEditingController();
  final observaciones = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Registro de Servicio'),
          backgroundColor: Colors.red,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            Text(
              'codigo de servicio',
              textAlign: TextAlign.center,
            ),
            _crearInput('Cliente', TextInputType.text, "Nombre de Cliente",cliente),
            _crearInput('Nro de Orden', TextInputType.text, "ORD-DD-123",orden),
            _crearInput('Fecha', TextInputType.datetime, "YYYYMMDD",fecha),
            _crearInput('Linea', TextInputType.text, "NOMBRE DE LINEA",linea),
            _crearInput('Estado', TextInputType.text, "Aprobado / Rechazado / Pendiente",estado),
            _crearInput('Observaciones', TextInputType.text, "",observaciones),
            SizedBox(height: 20,),
            FlatButton(
              onPressed: () => _registrar(context),
              child: Container(
                padding: EdgeInsets.all(20),
                width: 100,
                child: Text("Grabar", style: TextStyle( fontSize: 20), textAlign: TextAlign.center,),
                color: Colors.grey,
              )
            )
          ],
        ));
  }

  Widget _crearInput(String label, TextInputType inputType, String placeholder, TextEditingController control) {
    return TextField(
      controller: control,
      keyboardType: inputType,
      decoration: InputDecoration(labelText: label, hintText: placeholder),
    );
  }

  _registrar(BuildContext context) async {
    final serviceProvider = Provider.of<ServiceProvider>(context, listen: false);
    if(
      cliente.text.isNotEmpty &&
      orden.text.isNotEmpty &&
      fecha.text.isNotEmpty &&
      linea.text.isNotEmpty &&
      estado.text.isNotEmpty &&
      observaciones.text.isNotEmpty
    ){
      Servicio params = new Servicio(
        nombreCliente : cliente.text,
        numeroOrdenServicio : orden.text,
        fechaProgramada : fecha.text,
        linea : linea.text,
        estado : estado.text,
        observaciones : observaciones.text
      );
      Servicio service = await serviceProvider.createService(params);
      notify(context, 'Registrado!', 'Se creó el codigo de Servicio : ${service.codigoServicio}', 'Ok');
    }else{
      notify(context, 'Error', 'Complete todos los campos', 'Cerrar');
    }
  }
}
