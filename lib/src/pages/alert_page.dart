import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert Page"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Mostrar Alerta"),
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
            title: const Text("Titulo"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [Text("Contenido de la caja de Alerta"), FlutterLogo()],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Ok")),
            ],
          );
        });
  }
}
