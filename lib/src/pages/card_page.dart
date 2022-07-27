import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [_cardOne(), const SizedBox(height: 30), _cardTwo()],
      ),
    );
  }

  Widget _cardTwo() {
    return Card(
      child: Column(
        children: [
          FadeInImage(
              placeholder: AssetImage("jar-loading.gif"),
              image: NetworkImage(
                  "https://media.istockphoto.com/photos/businessman-using-a-computer-for-property-sales-listings-realtor-picture-id1335050734")),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("Cualquier Imagen"),
          ) // clase 74
        ],
      ),
    );
  }

  Widget _cardOne() {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text("Titulo"),
            subtitle: Text("Subtitle"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: Text("Cancel")),
              TextButton(onPressed: () {}, child: Text("Ok"))
            ],
          )
        ],
      ),
    );
  }
}
