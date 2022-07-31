import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  const InputsPage({Key? key}) : super(key: key);

  @override
  State<InputsPage> createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  String _name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inputs Page"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _inputCreate(),
          const Divider(),
          _personCreated(),
        ],
      ),
    );
  }

  Widget _inputCreate() {
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        counter: Text("Letras ${_name.length}"),
        hintText: "Nombre y Apellidos",
        labelText: "Nombre y Apellidos",
        helperText: "Si no sabes tu nombre preguntalo",
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  // clase 80

  Widget _personCreated() {
    return ListTile(title: Text("Nombre es $_name"));
  }
}
