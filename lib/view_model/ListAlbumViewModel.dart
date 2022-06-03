import 'package:code_test_mvvm/model/AlbumModel.dart';
import 'package:code_test_mvvm/services/service.dart';

class ListAlbumViewModel{
  List<AlbumViewModel>? albums;

  Future<void> fetAlbum() async{
    final apiResult = await Service().fetchAlbumAPI();
    this.albums = apiResult.map((e) => AlbumViewModel(e)).toList();
  }
}

class AlbumViewModel{
  final AlbumModel? album;

  AlbumViewModel(this.album);
}