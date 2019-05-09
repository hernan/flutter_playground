import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.count(
          padding: EdgeInsets.all(20.0),
          crossAxisSpacing: 10.0,
          crossAxisCount: 2,
          children: <Widget>[
            HomeButton(
              icon: Icons.brightness_7,
              onPressed: () => Navigator.pushNamed(context, '/popup')),
            HomeButton(
              icon: Icons.save,
              onPressed: () => Navigator.pushNamed(context, '/tabs')),
            HomeButton(
              icon: Icons.bookmark,
              onPressed: () => Navigator.pushNamed(context, '/form')),
          ],
        ),
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  /// Icon data
  final IconData icon;
  /// Callback call when button is pressed
  final VoidCallback onPressed;

  HomeButton({@required this.icon, @required this.onPressed}) :
    assert(icon != null),
    assert(onPressed != null);


  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        iconSize: 46.0,
        icon: Icon(icon, color: Colors.deepPurpleAccent,),
        onPressed: onPressed
      )
    );
  }
}
