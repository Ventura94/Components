import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100.0;
  bool _lockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider"),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _sliderCreate(),
            const Divider(),
            _checkBoxCreate(),
            const Divider(),
            _switchCreate(),
            Expanded(child: _imageCreate()),
          ],
        ),
      ),
    );
  }

  Widget _checkBoxCreate() {
    return CheckboxListTile(
        title: const Text("Bloquear Slider"),
        value: _lockCheck,
        onChanged: (value) {
          setState(() {
            _lockCheck = value!;
          });
        });
  }

  Widget _switchCreate() {
    return SwitchListTile(
        title: const Text("Bloquear Slider"),
        value: _lockCheck,
        onChanged: (value) {
          setState(() {
            _lockCheck = value;
          });
        });
  }

  Widget _imageCreate() {
    return Image(
      image: const NetworkImage(
          "https://as01.epimg.net/meristation/imagenes/2021/10/06/noticias/1633514535_199538_1633514571_noticia_normal.jpg"),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }

  Widget _sliderCreate() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: "Tamaño de la Imagen",
      divisions: 20,
      value: _sliderValue,
      min: 10,
      max: 400,
      onChanged: (_lockCheck)
          ? null
          : (selected) {
              setState(() {
                _sliderValue = selected;
              });
            },
    );
  }
}
// Clase 86