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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Albums"),),
      body: FutureBuilder(
        future: listAlbumViewModel.fetchAlbums(),
        builder: (context, snapshot){
           if (snapshot.connectionState == ConnectionState.waiting) {
             return Text("Waiting");
          }else{
            return ListView.builder(
              itemCount: listAlbumViewModel.albums?.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title:Card(
                child: Padding(
                padding:EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                       // new Flexible(child: Text(""))
                        ],
                    ),
                    Flexible(
                     child: Text("Artist: ${listAlbumViewModel.albums?[index].album?.artistName}")
                     ),
                    /*Flexible(
                     child: Text("Collection: ${listAlbumViewModel.albums?[index].album?.collectionName}")
                     )*/
                  ],
                ),
                )
                ),
                );
              }
              );
          }
            
        }
      )


      );
  }
}