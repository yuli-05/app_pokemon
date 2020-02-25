import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/pokemon.dart';
import "pokemon.dart";

class detalles extends StatelessWidget {
  final Pokemon pokemon;

  detalles({this.pokemon});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: new AppBar(
        backgroundColor: Colors.cyan,
        title: Text(pokemon.name),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.12,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 70.0,
                  ),
                  Text(
                    pokemon.name,
                    style: TextStyle(fontSize: 25.0),
                  ),
                  Text("Heigh: ${pokemon.height}"),
                  Text("Weight: ${pokemon.weight}"),
                  Text(
                    "Types:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: pokemon.type
                        .map((t) => FilterChip(
                            backgroundColor: Colors.amber,
                            label: Text(t),
                            onSelected: (b) {}))
                        .toList(),
                  ),
                  /*EVOLUCION*/
                  Text(
                    "Next Evolution:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: pokemon.nextEvolution
                        .map((t) => FilterChip(
                            backgroundColor: Colors.green,
                            label: Text(t.name),
                            onSelected: (b) {}))
                        .toList(),
                  ),
                  Text("Weakness",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses
                        .map((t) => FilterChip(
                            backgroundColor: Colors.red,
                            label: Text(
                              t,
                              style: TextStyle(color: Colors.white),
                            ),
                            onSelected: (b) {}))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: pokemon.img,
              child: Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(pokemon.img))),
              ),
            ),
          )
        ],
      ),

    );
  }
}
