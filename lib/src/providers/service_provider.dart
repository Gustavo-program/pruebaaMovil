import 'dart:convert';

import 'package:cl3_marianoroman/src/models/servicioBe_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ServiceProvider extends ChangeNotifier {
  
  Servicio servicioProv;
  Servicios serviciosProv;
  
  String _url = "wscibertec2021.somee.com";
  final _headers = {
    'Accept': 'application/json'
  };

  Future<List<Servicio>> getServicesByName(String nombreCliente) async {
    final uri = Uri.http(_url, '/Servicio/Listar',{
      "NombreCliente" : nombreCliente
    });
    final resp = await http.get(uri,headers: _headers);
    final decodedData = json.decode(resp.body);

    serviciosProv = new Servicios.fromJsonList(decodedData);
    notifyListeners();
    return this.serviciosProv.servicios;
  }

    Future<Servicio> createService  (Servicio servicio) async {
    final uri = Uri.http(_url, '/Servicio/RegistraModifica',{
      "Accion" : "N",
      "CodigoServicio": "0",
      "NombreCliente": servicio.nombreCliente,
      "NumeroOrdenServicio": servicio.numeroOrdenServicio,
      "FechaProgramada": servicio.fechaProgramada,
      "Linea": servicio.linea,
      "Estado": servicio.estado,
      "Observaciones": servicio.observaciones
    });

    final resp = await http.get(uri,headers: _headers);
    final decodedData = json.decode(resp.body);

    servicioProv = new Servicio.fromJson(decodedData);
    notifyListeners();
    return this.servicioProv;
  }

}