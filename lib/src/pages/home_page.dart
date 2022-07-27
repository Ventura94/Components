import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/providers/menu_provider.dart';
import 'package:flutter/material.dart';

import '../utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Components"),
        ),
        body: _listViews());
  }

  FutureBuilder<List> _listViews() {
    return FutureBuilder(
      future: menuProvider.chargeData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listViewItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listViewItems(List<dynamic>? data, BuildContext context) {
    final List<Widget> options = [];

    data?.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element["texto"]),
        leading: MyIconsString.getIcon(element["icon"]),
        trailing: const Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.pushNamed(context, element["ruta"]);
        },
      );
      options
        ..add(widgetTemp)
        ..add(const Divider());
    });
    return options;
  }
}
