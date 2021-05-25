import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_apps/bloc/moviebloc/movie_bloc.dart';
import 'package:movie_apps/bloc/moviebloc/movie_bloc_event.dart';
import 'package:movie_apps/bloc/moviebloc/movie_bloc_state.dart';
import 'package:movie_apps/model/movie.dart';

class TendancesPage extends StatefulWidget {
  const TendancesPage({Key key}) : super(key: key);

  @override
  _TendancesPageState createState() => _TendancesPageState();
}

class _TendancesPageState extends State<TendancesPage> {



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

  //  final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;

    final double itemWidth = size.width / 2;



    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(
          create: (_) => MovieBloc()..add(MovieEventStarted(0, '')),
        ),
        /*   BlocProvider<PersonBloc>(
          create: (_) => PersonBloc()..add(PersonEventStated()),
        ),

      */
      ],
      child: Container(
        decoration: BoxDecoration (
          color: Colors.black,

          borderRadius: BorderRadius.only (
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          ),

        ) ,
        child: _buildBody(context,itemHeight:itemHeight, itemWidth: itemWidth ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, {final double itemHeight, final double itemWidth}) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                if (state is MovieLoading) {
                  return Center(
                    child: Platform.isAndroid
                        ? CircularProgressIndicator()
                        : CupertinoActivityIndicator(),
                  );
                } else if (state is MovieLoaded) {
                  List<Movie> movies = state.movieList;
                  return

                    Container(
                         //    margin: EdgeInsets.only(left:15.0, right: 15.0,  bottom: 15.5),
                         margin: EdgeInsets.only(left:5.0, right: 5.0,  bottom: 0.0),
                         height: MediaQuery.of(context).size.height,
                      child: GridView.count(
                        scrollDirection: Axis.vertical,
                        childAspectRatio: (itemWidth / itemHeight),
                        crossAxisCount: 3 ,
                        children: List.generate(
                            movies.length,(index){
                          return Container(
     //                       color: Colors.white,
                            child: GestureDetector(
                              onTap: (){

                              },
                              child:  Container(
                                margin: EdgeInsets.all(8.0),
                                color: Colors.transparent,
                                height: 100, width: 130,
                                child: Column(children: [

                                  SizedBox(
                                    height: 100,
                                    child: Container(
       //                               color: Colors.blue,
                                      child: ClipRRect(

                                        borderRadius: BorderRadius.all(Radius.circular(15.0)),

                                        child:  Container(

                                          child:  CachedNetworkImage(
                                            imageUrl:
                                            'https://image.tmdb.org/t/p/original/${movies[index].backdropPath}',
                                            placeholder: (context, url) => Center (child:Container(child: Image.asset("assets/placeholder.gif"),),) ,
                                            errorWidget: (context, url, error) => Icon(Icons.error, size: 32, color: Colors.white,),
                                          ),

                                        ),
                                      ),
                                    ),
                                  ),


                                  // Titre films
                                  SizedBox(
                                    height: 20,
                                    child: Container(
                              //        color: Colors.red,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [

                                            Align(alignment: Alignment.centerLeft, child: Container( child:
                                            Text(
                                              movies[index].title.toUpperCase(),

                                              maxLines: 1, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),)),

                                          ],
                                        ),
                                      ),
                                    ),
                                  )


                                ],),
                              ),
                            ),
                          );

                        }),
                      ),
                    );




                }


                else {
                  return Container(
                    child: Text('Something went wrong!!!'),
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }

}
