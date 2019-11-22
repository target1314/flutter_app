import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'second_page.dart';

var clickText;
var titleList = ['电影', '电视', '综艺', '读书', '音乐', '同城'];
List<Widget> tabList;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text('首页'),
          ),
          body: Center(
            child: new ListDemo(),
          )),
      routes: <String, WidgetBuilder>{
        '/second_page': (BuildContext content) {
          return new SecondPage(
            title: clickText,
          );
        }
      },
    );
  }
}

class ListDemo extends StatefulWidget {
  @override
  _ListDemoState createState() {
    return new _ListDemoState();
  }
}

class _ListDemoState extends State<ListDemo> {
  Widget buildListTitle(BuildContext context, String item) {
    return new ListTile(
      isThreeLine: true,
      dense: false,
      leading: new CircleAvatar(
        child: new Text(item),
      ),
      title: new Text('子item的标题'),
      subtitle: new Text('子item的内容'),
      trailing: new Icon(
        Icons.arrow_right,
        color: Colors.green,
      ),
      onTap: () {
        print('ListView点击事件');
        clickText = item;
        Navigator.of(context).pushNamed('/second_page');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> items = <String>[
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J'
    ];
    Iterable<Widget> listTitles = items.map((String item) {
      return buildListTitle(context, item);
    });
    listTitles = ListTile.divideTiles(context: context, tiles: listTitles);
    return new Scaffold(
      body: new Scrollbar(
        child: new ListView(
          children: listTitles.toList(),
        ),
      ),
    );
  }
}
