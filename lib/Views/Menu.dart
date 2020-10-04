

import 'package:cybersafety/Views/Module1.dart';
import 'package:cybersafety/Views/Module2.dart';
import 'package:cybersafety/Views/Module3.dart';
import 'package:cybersafety/Views/Module4.dart';
import 'package:cybersafety/Views/Module5.dart';
import 'package:cybersafety/Views/Module6.dart';
import 'package:cybersafety/Views/Module7.dart';
import 'package:flutter/material.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Module 1",Icons.computer),
    new DrawerItem("Module 2", Icons.network_check),
    new DrawerItem("Module 3", Icons.bluetooth_audio),
    new DrawerItem("Module 4",Icons.computer),
    new DrawerItem("Module 5",Icons.computer),
    new DrawerItem("Module 6",Icons.computer),
    new DrawerItem("Module 7",Icons.computer),
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new Module1();
      case 1:
        return new Module2();
      case 2:
        return new Module3();
      case 3:
        return new Module4();
      case 4:
        return new Module5();
      case 5:
        return new Module6();
      case 6:
        return new Module7();

      default:
        return new Text("Error");
    }
  }
  
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(d.icon),
          title: new Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        )
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("CYBER SAFETY"), accountEmail: new Text('aviwadhwa1908@gmail.com')),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}