import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    var routes = <String, WidgetBuilder>{
      "/details": (BuildContext context) => new DetailsPage(title: "Details page"),
    };

    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new MyHomePage(title: 'Hello Flutter!'),
      routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _showDetails() {
    Navigator.of(context).pushNamed("/details");
  }

  @override
  Widget build(BuildContext context) {

    Widget card = new Card(
      elevation: 1.25,
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Container(
            constraints: new BoxConstraints.expand(
              height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 110.0,
            ),
            child: new Image.asset('images/dribba.png', fit: BoxFit.cover),
          ),
          const ListTile(
            title: const Text('Foto con animación Hero'),
            subtitle: const Text('Aquí va el subtítulo, descripción de la card.'),
          ),
          new ButtonTheme.bar(
            child: new ButtonBar(
              children: <Widget>[
                new FlatButton(
                  child: const Text('VER MÁS'),
                  onPressed: _showDetails,
                ),
              ],
            ),
          ),
        ],
      ),
    );

    var hero = new Hero(
      tag: 'hero-tag-dribba',
      child: card,
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView(
        children: <Widget>[
          hero,
        ],
      ),

    );
  }
}

class DetailsPage extends StatefulWidget {
  DetailsPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _DetailsPageState createState() => new _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    var decoratedBox = new DecoratedBox(
      decoration: new BoxDecoration(
        image: new DecorationImage(image: new AssetImage('images/dribba.png'), fit: BoxFit.fitWidth)
      ),
    );

    //Hero center
    var hero = new Hero(
      tag: 'hero-tag-dribba',
      child: decoratedBox,
    );

    var center = new Center(
      child: new Container(
        height: 600.0,
        width: 600.0,
        child: hero,
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: center,
    );
  }
}
