import 'package:counterprovider/counter.dart';
import 'package:counterprovider/secondCounter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider<Counter>(
              builder: (_) => Counter(0),
            ),
            ChangeNotifierProvider<SecondCounter>(
              builder: (_) => SecondCounter(5),
            ),
          ],
          child: HomePage(),
        ));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    final secondCounter = Provider.of<SecondCounter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Demo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            'First  = ${counter.getCounter()}',
          ),
          Text('Second  = ${secondCounter.getCounter()}'),
          RaisedButton(
              onPressed: () {
                secondCounter.increment();
              },
              child:
                  Text('+ 5 Counter Second', style: TextStyle(fontSize: 20))),
          RaisedButton(
              onPressed: () {
                secondCounter.decrement();
              },
              child:
                  Text('- 5 Counter Second', style: TextStyle(fontSize: 20))),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: counter.increment,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: counter.decrement,
            tooltip: 'Increment',
            child: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
