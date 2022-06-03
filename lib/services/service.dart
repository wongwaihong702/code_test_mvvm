import 'package:code_test_mvvm/model/AlbumModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Service{
  Future<List<AlbumModel>> fetchAlbumAPI() async{
    String url = "https://itunes.apple.com/search?term=jack+johnson&entity=album";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200){
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final jsonResult = json["results"];
      final listResult = jsonResult.map((e) => AlbumModel.fromJson(e)).toList();
      return listResult;
    }
    else{
      throw Exception('Fail to fetch albums');
    }
  }
}