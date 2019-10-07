import 'package:flutter/material.dart';
import 'package:stream_demo/dao.dart';
import 'package:stream_demo/dao2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
  Dao2 instance;

  @override
  void initState() {
    super.initState();
    instance = Dao2.getInstance();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          initialData: null,
          stream: instance.a.stream(),
          // builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          //   print(snapshot.data);
          //   return Text('${snapshot.data}');
          // },
          builder: (BuildContext context, AsyncSnapshot<A> snapshot) {
            print(snapshot?.data?.value);
            return Text('${snapshot?.data?.value}');
          },
          // builder: ,
        )
      ),
      body: Center(
      )
    );
  }
}
