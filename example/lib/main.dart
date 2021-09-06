import 'package:example/route_helper.dart';
import 'package:example/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifecycle_detect/lifecycle_detect.dart';
import 'dart:math';

class Observer {
  void onChanged(){

  }
}

void injectDemo(List<Observer> observers) {
  int a = 10;
  if (a > 5) {
    print('[KWLM]:if1');
  }
  print('[KWLM]:a');
  for (Observer o in observers) {
    print('[KWLM]:Observer1');
    o.onChanged();
    print('[KWLM]:Observer2');
  }
  print('[KWLM]:b');
  for (int i = 0; i < 10; i++) {
    print('[KWLM]:for i $i');
    print('[KWLM]:for i $i');
  }
  print('[KWLM]:c');
}

void main() {
  injectDemo([]);
  C()..fa();
  runApp(MyApp());
  LifecycleDetect.getInstance().init();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        // routes: RouteHelper.routes,
        onGenerateRoute: (RouteSettings settings) {
          print("onGenerateRoute+++++++");
          return MaterialPageRoute<dynamic>(
              builder: (BuildContext context){
                print("builder+++++++");
                return RouteHelper.routes[settings.name](context);
              },
              settings: settings);
        }

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    C()..fc();
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    utils.printDebugLog("main");
    LifecycleDetect.getInstance().addLifecycleObserver(LifecycleObserver(
      onResume: (String pageName,bool isNative){
     print('LifecycleDetect=======onResume:::pageName:$pageName   isNative:$isNative');
      },
      onPause: (String pageName,bool isNative){
       print('LifecycleDetect=======onPause:::pageName:$pageName   isNative:$isNative');
      },
    ));
  }

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
            GestureDetector(
              child: Container(
                color: Colors.blue,
                child: Text(
                  "GestureDetector点击",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, RouteHelper.firstPage);
              },
            ),
            FlatButton(
                onPressed: () {},
                child: Text(
                  "FlatButton点击",
                  style: TextStyle(fontSize: 20),
                )),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _incrementCounter();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class A {
  void fa(){}
}

class B {
  void fb() {

  }
}

class C with A,B {
  C(){

  }
  void fc() {

  }
}
