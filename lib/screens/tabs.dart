import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _currentTab = 0;
//  List<Widget> _listItems = [];
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
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _textStyle() {
    return new TextStyle(color: Colors.white, fontSize: 30.0);
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      return;
    }
    print('TabController index: ${_tabController.index}');
    setState(() {
      _currentTab = _tabController.index;
    });
  }

  List<Widget> _showTabBarActions() {
    return _currentTab == 0 ? [Icon(Icons.android)] : [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar'),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
//                icon: Icon(Icons.android),
              text: 'People',
            ),
            Tab(
              text: 'Projects',
            ),
            Tab(
              text: 'Tickets'
            )
          ],
        ),
        actions: _showTabBarActions()
      ),
      body: TabBarView(
        controller: _tabController,
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
                style: _textStyle(),
              ),
            ),
          ),
          new Container(
            color: Colors.teal,
            child: new Center(
              child: new Text(
                "Third",
                style: _textStyle(),
              ),
            ),
          ),
        ]),
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
