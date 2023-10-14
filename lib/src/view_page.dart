import 'dart:convert';

import 'package:flutter/material.dart';

class ViewPage extends StatefulWidget {
  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 12 - Leer JSON'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString('assets/pokedex.json'),
          initialData: [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            var showData = json.decode(snapshot.data.toString());
            return ListView.builder(
                itemCount: showData["pokemons"].length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(showData["pokemons"][index]["name"]["english"]),
                    subtitle:
                        Text(showData["pokemons"][index]["type"].toString()),
                  );
                });
          },
        ),
      ),
    );
  }
}
