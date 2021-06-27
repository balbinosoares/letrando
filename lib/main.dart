import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Letrando',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Letrando'),
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
  String _imageSrc = 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg';

  void _changeImage() {
    setState(() {
      _imageSrc = 'https://conteudo.imguol.com.br/c/entretenimento/10/2021/04/12/abelha-em-flor-no-brasil-1618239781566_v2_450x337.jpg';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(_imageSrc),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: TextFormField(
              decoration: InputDecoration(border: UnderlineInputBorder()),
              textAlign: TextAlign.center,
            )
            ),
           
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeImage,
        tooltip: 'Nova Imagem',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
