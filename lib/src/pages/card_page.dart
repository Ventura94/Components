import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [_cardOne(), const SizedBox(height: 30), _cardTwo()],
      ),
    );
  }

  Widget _cardTwo() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          const FadeInImage(
              height: 400.0,
              //width: 400.0,
              fit: BoxFit.cover,
              placeholder: AssetImage("jar-loading.gif"),
              image: NetworkImage(
                  "https://media.istockphoto.com/photos/businessman-using-a-computer-for-property-sales-listings-realtor-picture-id1335050734")),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text("Cualquier Imagen"),
          )
        ],
      ),
    );
  }

  Widget _cardOne() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.photo_album),
            title: Text("Titulo"),
            subtitle: Text("Subtitle"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: const Text("Cancel")),
              TextButton(onPressed: () {}, child: const Text("Ok"))
            ],
          )
        ],
      ),
    );
  }
}
