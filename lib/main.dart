import 'package:flutter/material.dart';
import 'package:listas_1/lugares.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyStateFullWidget(),
    );
  }
}

class MyStateFullWidget extends StatefulWidget
{
  @override
  _MyStateFullWid createState() => new _MyStateFullWid();

}

class _MyStateFullWid extends State<MyStateFullWidget>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar:  AppBar(
        title: new Text("Prueba LISTAS"),
      ),
      body: ListView.builder(
        itemCount: lugares.length,
        padding: const EdgeInsets.all(15.0),
        itemBuilder: (context, position){
          return Column(
            children: <Widget>[
              Divider(height: 5.0,),
              ListTile(
                title: Text(lugares[position].name),
              )
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: modificarLista,
        items: [
          new BottomNavigationBarItem(icon: new Icon(Icons.add), title: new Text('Add'), backgroundColor: Colors.lightGreen),
          new BottomNavigationBarItem(icon: new Icon(Icons.restaurant), title: new Text('Minus'), backgroundColor: Colors.red),
        ]
      ),
    );
  }

  void modificarLista (int page){

    lugares.add("7","Palacio de kk","cat kk","Calle kk"  )
  }



}

