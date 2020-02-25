import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "ver_detalles.dart";
import "pokemon.dart";

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme:
      ThemeData(brightness: Brightness.light, primarySwatch: Colors.blue),
      darkTheme: ThemeData(
          brightness: Brightness.dark, primarySwatch: Colors.blueGrey),
      home: homePage(),
    );
  }
}

class homePage extends StatefulWidget {
  @override
  _myHomePageState createState() => new _myHomePageState();
}


class _myHomePageState extends State<homePage> {
  var url =
      "https://raw.githubusercontent.com/Azazel17/pokehub/master/pokehub.json";
  PokeHub pokeHub;


  void initState() {
    super.initState();
    bajar();
  }


  void bajar() async {
    //async = asincrono
    var res = await http.get(url);
    print(res.body);
    var decodeJson = jsonDecode(res.body);
    pokeHub = PokeHub.fromJson(decodeJson);
    print(pokeHub.toJson());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Pokedex"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: pokeHub == null
            ? Center(
          child: CircularProgressIndicator(),
        )
            : GridView.count(
            crossAxisCount: 2,
            children: pokeHub.pokemon
                .map((poke) => Padding(
              padding: const EdgeInsets.all(2.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => detalles(
                            pokemon: poke,
                          )));
                },
                child: Hero(
                  tag: poke.img,
                  child: Card(
                    elevation: 3.0,
                    child: new Column(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(poke.img))),
                        ),
                        Text(
                          poke.name,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ))
                .toList()));
  }
}