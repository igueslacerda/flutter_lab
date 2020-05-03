import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:igues_mobx_class/controller/controller.dart';
import 'package:igues_mobx_class/controller/gencontroller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  final controller = Controller();
  final genController = GenController();

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
              Text(
                'You have pushed the button this many times:',
              ),
              Observer(builder: (_) {
                return Text(
                  '${controller.numeroDeClicks.value}',
                  style: Theme.of(context).textTheme.display1,
                );
              }),
              Text('Com codigo gerado:'),
              Observer(builder: (_) {
                return Text(
                  '${genController.numeroDeClicks}',
                  style: Theme.of(context).textTheme.display1,
                );
              }),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: controller.addClick,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
                onPressed: genController.addClick,
                tooltip: 'Increment',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Icon(Icons.add), Icon(Icons.add)],
                )),
          ],
        ));
  }
}
