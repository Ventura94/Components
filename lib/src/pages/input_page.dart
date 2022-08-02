import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  const InputsPage({Key? key}) : super(key: key);

  @override
  State<InputsPage> createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  String _name = "";
  String _email = "";
  String _password = "";
  String _date = "";
  String _selectedOption = "Volar";

  final List<String> _powers = ["Volar", "Rayos X", "Fuerza"];

  final TextEditingController _inputFieldDateController =
      TextEditingController();

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
          _emailCreate(),
          const Divider(),
          _passwordCreate(),
          const Divider(),
          _dateCreate(context),
          const Divider(),
          _dropdownCreate(),
          const Divider(),
          _personCreated(),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> _dropDownItem() {
    List<DropdownMenuItem<String>> list = [];
    for (String power in _powers) {
      list.add(DropdownMenuItem(
        value: power,
        child: Text(power),
      ));
    }
    return list;
  }

  Widget _dropdownCreate() {
    return Row(
      children: [
        const Icon(Icons.select_all),
        const SizedBox(
          width: 30.0,
        ),
        Expanded(
          child: DropdownButton(
              items: _dropDownItem(),
              value: _selectedOption,
              onChanged: (select) {
                setState(() {
                  _selectedOption = select.toString();
                });
              }),
        ),
      ],
    );
  }

  Widget _dateCreate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      autofocus: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: "Fecha de Nacimiento",
        labelText: "Fecha de Nacimiento",
        suffixIcon: const Icon(Icons.perm_contact_calendar),
        icon: const Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2025),
        locale: const Locale("es", "ES")) as DateTime;

    setState(() {
      _date = picked.toString();
      _inputFieldDateController.text = _date;
    });
  }

  Widget _passwordCreate() {
    return TextField(
        obscureText: true,
        autofocus: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: "Password",
          labelText: "Password",
          suffixIcon: const Icon(Icons.lock_open),
          icon: const Icon(Icons.lock),
        ),
        onChanged: (value) => setState(() {
              _password = value;
            }));
  }

  Widget _emailCreate() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        autofocus: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: "Email",
          labelText: "Email",
          suffixIcon: const Icon(Icons.alternate_email),
          icon: const Icon(Icons.email),
        ),
        onChanged: (value) => setState(() {
              _email = value;
            }));
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
        suffixIcon: const Icon(Icons.accessibility),
        icon: const Icon(Icons.account_circle),
      ),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _personCreated() {
    return ListTile(
      title: Text("Nombre: $_name"),
      subtitle: Text("Email: $_email"),
      trailing: Text("Poder: $_selectedOption"),
    );
  }
}
