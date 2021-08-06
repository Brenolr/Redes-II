import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Minha Horta'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  RangeValues _light_range = RangeValues(20, 40);
  RangeValues _humidity_soil = RangeValues(20, 70);
  RangeValues _humidity_air = RangeValues(20, 70);
  RangeValues _temperaturas = RangeValues(15, 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              child: ListTile(
                title: RangeSlider(
                    values: _humidity_soil,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    onChanged: (RangeValues values) {
                      setState(() {
                        _humidity_soil = values;
                      });
                    }),
                subtitle: Text(
                  'Umidade:',
                ),
                leading: Icon(Icons.invert_colors),
                trailing: Text(
                  _humidity_soil.start.toString() +
                      "% - " +
                      _humidity_soil.end.toString() +" %",
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: RangeSlider(
                  min: 0,
                  max: 50,
                  divisions: 100,
                  onChanged: (RangeValues values) {
                    setState(() {
                      _temperaturas = values;
                    });
                  },
                  values: _temperaturas,
                ),
                subtitle: Text(
                  'Temperatura:',
                ),
                leading: Icon(Icons.wb_sunny),
                trailing: Text(
                  _temperaturas.start.toStringAsPrecision(3) +
                      "ºC - " +
                      _temperaturas.end.toStringAsPrecision(3) + " ºC",
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: RangeSlider(
                    values: _humidity_air,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    onChanged: (RangeValues values) {
                      setState(() {
                        _humidity_air = values;
                      });
                    }),
                subtitle: Text(
                  'Umidade:',
                ),
                leading: Icon(Icons.invert_colors),
                trailing: Text(
                  _humidity_air.start.toString() +
                      "% - " +
                      _humidity_air.end.toString() +" %",
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: RangeSlider(
                  min: 0,
                  max: 60,
                  divisions: 60,
                  onChanged: (RangeValues values) {
                    setState(() {
                      _light_range = values;
                    });
                  },
                  values: _light_range,
                ),
                subtitle: Text(
                  'Lumisidade:',
                ),
                leading: Icon(Icons.wb_sunny),
                trailing: Text(
                  _light_range.start.toStringAsPrecision(3) +
                      "L - " +
                      _light_range.end.toStringAsPrecision(3) + " L",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}