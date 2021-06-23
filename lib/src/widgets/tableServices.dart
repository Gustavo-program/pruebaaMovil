import 'dart:convert';

import 'package:cl3_marianoroman/src/providers/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';
import 'package:provider/provider.dart';

class TableService extends StatefulWidget {

  TableService() : super();

  @override
  _TableServiceState createState() => _TableServiceState();
}

class _TableServiceState extends State<TableService> {
  
  @override
  Widget build(BuildContext context) {

    final serviceProvider = Provider.of<ServiceProvider>(context);
    
    if(serviceProvider.serviciosProv == null){
      return JsonTable([
         {
            "CodigoServicio": 0,
            "NombreCliente": "",
            "NumeroOrdenServicio": "",
            "FechaProgramada": "",
            "Linea": "",
            "Estado": "",
            "Observaciones": "",
            "Eliminado": false,
            "CodigoError": 0,
            "DescripcionError": "",
            "MensajeError": ""
        }
      ]);
    }

    final _json = json.encode(serviceProvider.serviciosProv.servicios);
    final _body = json.decode(_json);

    return JsonTable(_body, showColumnToggle: true,);
  }
}