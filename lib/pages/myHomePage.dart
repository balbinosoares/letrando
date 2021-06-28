import 'package:flutter/material.dart';
import 'dart:async';
import 'package:letrando/model/model.dart';
import 'package:http/http.dart' as http;


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _imageSrc = 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'; // 
  //Future<String> _imageSrc; //Acrescentar late
  String   response; //Converter para Flutter > 2.12 adicionar late

  final textController = TextEditingController(); // Controller para pegar os valores do textInput
  final model = new Model();
  bool flg = true;

  void _changeImage() { 

    if (flg){
      model.fetchImages('coruja').then((String result){
        setState(() {
        _imageSrc = result;
        flg = false;
        });
      });
    }else{
      model.fetchImages('abelha').then((String result){
        setState(() {
        _imageSrc = result;
        flg = true;
        });
      });
    }

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
              controller: textController,
            ),
            
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