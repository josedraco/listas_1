import 'package:flutter/material.dart';
import 'lugares.dart';

class Favoritos{

  final _biggerFont = const TextStyle(fontSize: 18.0);
  Set<Lugar> _savedSuggestions;

  Favoritos(Set<Lugar> savedSuggest){_savedSuggestions = savedSuggest;}


  Scaffold getPage(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text('Favoritos'),),
      body: _getListView(context),);
  }


  ListView _getListView(BuildContext context){

    print (_savedSuggestions.length);

    final tiles = _savedSuggestions.map( (pair) {
      return new ListTile(title: new Text(pair.name, style: _biggerFont, ),);
    },
    );

    final dividedTiles = ListTile.divideTiles(tiles: tiles, context: context).toList();

    return new ListView(children: dividedTiles,);

  }





}