import 'package:code_test_mvvm/model/albumModel.dart';
import 'package:code_test_mvvm/view_model/ListAlbumViewModel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ListAlbumViewModel listAlbumViewModel = new ListAlbumViewModel();
  bool _showBookmark = false;
  List<AlbumModel> bookmarkedViewModel = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    listAlbumViewModel.fetchAlbums().then((result){
      setState(() {
        
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Albums"),
      actions: [ 
        Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () {_showBookmark = false;
          setState(() {});},
          child: const Text("ALL", 
            style: TextStyle(
              fontSize: 23,
              height: 2,
            ),),
        )
    )
        ,
        Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () {_showBookmark = true;
          setState(() {});},
          child: const Icon(
            Icons.star,
            size: 26.0,
            color: Colors.yellow,
          ),
        )
    )
        ]),
      body: ListView.builder(
              itemCount: listAlbumViewModel.albums?.length,
              //itemCount: 50,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return 
                Visibility( child: 
                Card(
                    child: ListTile(
                      leading: Image.network("${listAlbumViewModel.albums?[index].album?.artworkUrl60}",
                        errorBuilder: (context,exception, stackTrace) {
                        return CircleAvatar(backgroundColor: Colors.blue,);
                    },),
                      title: listAlbumViewModel.albums?[index].album?.collectionName == null?
                      Text("Loading..."):
                      Text("${listAlbumViewModel.albums?[index].album?.collectionName}"),
                      subtitle: listAlbumViewModel.albums?[index].album?.artistName == null?
                      Text("Loading..."):
                      Text("${listAlbumViewModel.albums?[index].album?.artistName}"),
                      trailing: GestureDetector(
                        child: (listAlbumViewModel.albums?[index].album?.bookmarked == false)
                          ? Icon(Icons.star_border_purple500_sharp, color: Colors.black,)
                          : Icon(Icons.star, color: Colors.yellow,),
                        onTap: ()  {
                          listAlbumViewModel.albums?[index].album?.toggleBookmark();
                          print("${listAlbumViewModel.albums?[index].album?.collectionName} has been tapped");
                          print(listAlbumViewModel.albums?[index].album?.bookmarked);
                          setState(() {
                            
                          });
                        },
                        ),
                      isThreeLine: true,
                    ),
                 ),visible:!_showBookmark || listAlbumViewModel.albums?[index].album?.bookmarked == _showBookmark,
                );
              }
              )
        );
  }
}
          
      