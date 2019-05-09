import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _currentTab = 0;
  List<Map<String, String>> _listItems = [
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
  List<Widget> _buildList() {
    // map return an Iterable that should get back to a list
    return _listItems.map((Map item) => ListItem(item)).toList();
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

  // https://github.com/flutter/flutter/issues/7032
  // https://github.com/MilkBiscuit/input_dialog_overflow_issue/blob/master/lib/main.dart
  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      return;
    }
//    print('TabController index: ${_tabController.index}');
    setState(() {
      _currentTab = _tabController.index;
    });
  }

  void _openListForm() async {
    Map<String, String> result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return ListForm();
      }
    );

    if (result != null) {
      setState(() {
        _listItems.add(result);
      });
    }
  }

  List<Widget> _showTabBarActions() {
    return _currentTab == 0 ? [
      IconButton(
        icon: Icon(Icons.edit),
        onPressed: _openListForm,
      )
    ] : [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar'),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(text: 'People'),
            Tab(text: 'Projects',),
            Tab(text: 'Tickets')
          ],
        ),
        actions: _showTabBarActions()
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            child: ListView(
              children: _buildList()
            )
          ),
          Container(
            color: Colors.blueGrey,
            child: Center(
              child: Text(
                "Second",
                style: _textStyle(),
              ),
            ),
          ),
          Container(
            color: Colors.teal,
            child: Center(
              child: Text(
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

class ListForm extends StatefulWidget {
  @override
  _ListFormState createState() => _ListFormState();
}

class _ListFormState extends State<ListForm> {
  final _listFormKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {
    'name': '',
    'description': ''
  };

  String _validator(String value) {
    if (value.trim().isEmpty) {
      return 'Can not be empty';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('New Item'),
      content: Form(
        key: _listFormKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                validator: _validator,
                onSaved: (value) => _formData['name'] = value,
              ),
              SizedBox(height: 20),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description'
                ),
                validator: _validator,
                onSaved: (value) => _formData['description'] = value,
              ),
              SizedBox(height: 20),
            ]
          ),
        ),
      ),
      actions: [
        FlatButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
        FlatButton(
          child: Text('Add'),
          onPressed: () {
            if (_listFormKey.currentState.validate()) {
              _listFormKey.currentState.save();
//              print('popup ListForm $_formData');
              Navigator.pop(context, _formData);
            }
          },
        )
      ]
    );
  }
}
