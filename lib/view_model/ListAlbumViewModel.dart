import 'package:code_test_mvvm/model/AlbumModel.dart';
import 'package:code_test_mvvm/services/service.dart';

class ListAlbumViewModel{
  List<AlbumViewModel>? albums;

  Future<void> fetchAlbums() async{
    final apiResult = await Service().fetchAlbumAPI();
    albums = apiResult.map((e) => AlbumViewModel(e)).toList();
  }

  Future<int> getLength() async{
    final apiResult = await Service().fetchAlbumAPI();
    return apiResult.length;
  }
}

class AlbumViewModel{
  final AlbumModel? album;

  AlbumViewModel(this.album);

  Stream<bool> getBookmark() async*{
    yield album?.bookmarked == true;
  }
}