

import 'package:flutter/material.dart';
import 'lugares.dart';
import 'favoritos.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {

  final _suggestions = <Lugar>[];
  final _saved = new Set<Lugar>();

  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          //new IconButton(icon: new Icon(Icons.list), onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => new Favoritos(_saved)),);})
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: lugares.length,
        itemBuilder: (context, i) {
          if (i.isOdd) new Divider();

          //print ('i= $i');
          _suggestions.addAll(lugares);

          final pair = _suggestions[i];
          final alreadySaved = _saved.contains(pair);
          //return _buildRow(_suggestions[index]);
          return new ListTile(
            title: new Text(pair.name,style: _biggerFont,),
            trailing: new IconButton(
              icon: alreadySaved ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
              color: alreadySaved ? Colors.red : null,
              onPressed: () {setState( () {
                  if (alreadySaved) {_saved.remove(pair);}
                  else {_saved.add(pair); }
                  },
              );
            },
          ),
          );
        },
      ),
    );
  }

  void _pushSaved(){
    final route = new MaterialPageRoute(builder: (context) =>  new Favoritos(_saved).getPage(context));
    Navigator.of(context).push(route);
  }

}