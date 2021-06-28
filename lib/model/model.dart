import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class Model{

static const String _apiKey = 'AIzaSyBsjqDRnRRp7iPMIVQtfIzCqBvDga93HXg'; //Configurado no GCP
static const String _custonSearchId = 'e833d96c793c12850'; //Configurado no GCP
static const String _url = 'https://www.googleapis.com/customsearch/v1';

Model(){

}



Future<String> fetchImages(String imageName) async{
  final response = await http.get(
    Uri.parse(_url + '?key=' + _apiKey + '&cx=' + _custonSearchId + '&searchType=image&q='+ imageName)
  ); 

  if(response.statusCode == 200){
    Map<String, dynamic> data = jsonDecode(response.body);
    var list = data['items'] as List;
    print(list.first[ 'link']);

    return list == null || list.isEmpty ? '': list.first[ 'link'];
  }else{
    throw Exception('Falha ao buscar imagens na API');
  }


  //return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
}


}


