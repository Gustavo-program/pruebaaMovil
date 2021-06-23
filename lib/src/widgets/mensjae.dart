import 'package:cl3_marianoroman/src/providers/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MensajeCount extends StatefulWidget {
  MensajeCount({Key key}) : super(key: key);

  @override
  _MensajeCountState createState() => _MensajeCountState();
}

class _MensajeCountState extends State<MensajeCount> {
  @override
  Widget build(BuildContext context) {

    final serviceProvider = Provider.of<ServiceProvider>(context);

    if(serviceProvider.serviciosProv == null){
      return Text("", textAlign: TextAlign.center);
    }

    return Text('Se encontraron: ${serviceProvider.serviciosProv.servicios.length} Servicios', textAlign: TextAlign.center);
  }
}