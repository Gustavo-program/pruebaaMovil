// To parse this JSON data, do
//
//     final servicio = servicioFromJson(jsonString);

import 'dart:convert';

Servicio servicioFromJson(String str) => Servicio.fromJson(json.decode(str));

String servicioToJson(Servicio data) => json.encode(data.toJson());

class Servicios {

  List<Servicio> servicios = new List();

  Servicios.fromJsonList(List<dynamic> jsonlist){
    if(jsonlist == null) return;

    jsonlist.forEach((element) {
      final servicio = Servicio.fromJson(element);
      servicios.add(servicio);
    });
  }

}


class Servicio {
    Servicio({
        this.codigoServicio,
        this.nombreCliente,
        this.numeroOrdenServicio,
        this.fechaProgramada,
        this.linea,
        this.estado,
        this.observaciones,
        this.eliminado,
        this.codigoError,
        this.descripcionError,
        this.mensajeError,
    });

    int codigoServicio;
    String nombreCliente;
    String numeroOrdenServicio;
    String fechaProgramada;
    String linea;
    String estado;
    String observaciones;
    bool eliminado;
    int codigoError;
    String descripcionError;
    dynamic mensajeError;

    factory Servicio.fromJson(Map<String, dynamic> json) => Servicio(
        codigoServicio: json["CodigoServicio"],
        nombreCliente: json["NombreCliente"],
        numeroOrdenServicio: json["NumeroOrdenServicio"],
        fechaProgramada: json["FechaProgramada"],
        linea: json["Linea"],
        estado: json["Estado"],
        observaciones: json["Observaciones"],
        eliminado: json["Eliminado"],
        codigoError: json["CodigoError"],
        descripcionError: json["DescripcionError"],
        mensajeError: json["MensajeError"],
    );

    Map<String, dynamic> toJson() => {
        "CodigoServicio": codigoServicio,
        "NombreCliente": nombreCliente,
        "NumeroOrdenServicio": numeroOrdenServicio,
        "FechaProgramada": fechaProgramada,
        "Linea": linea,
        "Estado": estado,
        "Observaciones": observaciones,
        "Eliminado": eliminado,
        "CodigoError": codigoError,
        "DescripcionError": descripcionError,
        "MensajeError": mensajeError,
    };
}
