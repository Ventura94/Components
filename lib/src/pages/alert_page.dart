import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert Page"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Mostrar Alerta"),
          onPressed: () => _showAlert(context),
        ),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text("Titulo"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [Text("Contenido de la caja de Alerta"), FlutterLogo()],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Ok")),
            ],
          );
        });
  }
}
