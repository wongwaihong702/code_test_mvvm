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
          child: const Icon(
            Icons.book,
            size: 26.0,
          ),
        )
    )
        ,
        Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () {_showBookmark = true;
          setState(() {});},
          child: const Icon(
            Icons.bookmark_added_sharp,
            size: 26.0,
          ),
        )
    )
        ]),
      body:FutureBuilder(
        future: listAlbumViewModel.getLength(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else {
            return 
          
        ListView.builder(
              //itemCount: listAlbumViewModel.albums?.length,
              itemCount: snapshot.data,
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
                          ? Icon(Icons.bookmark_add_sharp, color: Colors.black,)
                          : Icon(Icons.bookmark_added_sharp, color: Colors.blue,),
                        onTap: ()  {
                          listAlbumViewModel.albums?[index].album?.toggleBookmark();
                          print("${listAlbumViewModel.albums?[index].album?.collectionName} has been tapped");
                          print(listAlbumViewModel.albums?[index].album?.bookmarked);
                          setState(() {});
                        },
                        ),
                      isThreeLine: true,
                    ),
                 ),visible:!_showBookmark || listAlbumViewModel.albums?[index].album?.bookmarked == _showBookmark,
                );
              }
              );
              }
        }
        else{
                return Text("Loading");
              }
        }
        ) 
        );
  }
}
          
      