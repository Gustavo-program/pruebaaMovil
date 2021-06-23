import 'package:cl3_marianoroman/src/providers/service_provider.dart';
import 'package:cl3_marianoroman/src/widgets/mensjae.dart';
import 'package:cl3_marianoroman/src/widgets/tableServices.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _cliente = TextEditingController();


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Examen final'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [_opciones(context), _tabla()],
        ),
      ),
    );
  }

  Widget _opciones(BuildContext context) {

    final serviceProvider = Provider.of<ServiceProvider>(context,listen: false);

    return Column(
      children: [
        TextField(
          controller: _cliente,
          decoration: InputDecoration(labelText: 'Cliente'),
        ),
       
        MensajeCount(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FlatButton(
              onPressed:() => serviceProvider.getServicesByName(_cliente.text),
              child: Text('Consultar'),
              color: Colors.blueAccent,
              minWidth: 150,
            ),
            FlatButton(
              onPressed: () => Navigator.pushNamed(context, 'create'),
              child: Text('Nuevo'),
              color: Colors.blueAccent,
              minWidth: 150,
            ),
          ],
        )
      ],
    );
  }

  Widget _tabla() {
    return TableService();
  }
}
