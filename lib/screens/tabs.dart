import 'package:flutter/material.dart';

class TabsScreen extends StatelessWidget {
  textStyle() {
    return new TextStyle(color: Colors.white, fontSize: 30.0);
  }

  List<Widget> _buildList() {
    List<Map<String, String>> list = [
      {
        'name': 'Pedro Suares',
        'description': 'Some other child'
      },
      {
        'name': 'Juan Gamorra',
        'description': 'Solo por hoy veremos'
      },
      {
        'name': 'Paula Andrea',
        'description': 'Si supieras como estoy'
      },
      {
        'name': 'Pancho Gomez',
        'description': 'Aprendiendo Flutter'
      },
      {
        'name': 'Raquel Gimenez',
        'description': 'This is this way'
      },
      {
        'name': 'Ricardo Bluey',
        'description': 'Just because I can'
      },
      {
        'name': 'Alanis Lamar',
        'description': 'That sound is fine'
      },
      {
        'name': 'Rupert Lacome',
        'description': 'Pues digalo ahora'
      },
      {
        'name': 'John Snow',
        'description': 'The winter is comming'
      },
      {
        'name': 'Ian Murdock',
        'description': 'Casual observer'
      }
    ];

    // map return an Iterable that should get back to a list
    return list.map((Map item) => ListItem(item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
//                icon: Icon(Icons.android),
                text: 'Hours',
              ),
              Tab(
                text: 'Projects',
              ),
              Tab(
                text: 'Tickets'
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            new Container(
//              color: Colors.deepOrangeAccent,
              child: ListView(
                children: _buildList()
              )
            ),
            new Container(
              color: Colors.blueGrey,
              child: new Center(
                child: new Text(
                  "Second",
                  style: textStyle(),
                ),
              ),
            ),
            new Container(
              color: Colors.teal,
              child: new Center(
                child: new Text(
                  "Third",
                  style: textStyle(),
                ),
              ),
            ),
          ]),
        ),
      );
  }
}

class ListItem extends StatelessWidget {
  final Map<String, String> data;
  ListItem(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(data['name'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
          Text(data['description']),
          Divider()
        ],
      ),
    );
  }
}
