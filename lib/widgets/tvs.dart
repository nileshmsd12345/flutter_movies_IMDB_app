import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies_imdb_app/text.dart';

import '../description.dart';

class TvShows extends StatelessWidget {
  final List tvshows;

  const TvShows({Key key, this.tvshows}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text:"Popular Shows", size: 21 ,),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                itemCount: tvshows.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Description(name: tvshows[index]['original_name'], bannerurl:'http://image.tmdb.org/t/p/w500'+tvshows[index]['backdrop_path'] ,posterurl: 'http://image.tmdb.org/t/p/w500'+tvshows[index]['poster_path'], description: tvshows[index]['overview'],
                        vote: tvshows[index]['vote_average'].toString(), launch_on: tvshows[index]['first_air_date'],)));
                    },
                    child: Container(
                      width: 250,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 140,
                              width: 300,
                              decoration: BoxDecoration(image: DecorationImage(
                                image: NetworkImage(
                                  'http://image.tmdb.org/t/p/w500'+tvshows[index]['backdrop_path'],
                                ),
                                fit: BoxFit.fill,
                              ),
                                borderRadius: BorderRadius.circular(13),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Container(
                            child: ModifiedText(
                              text: tvshows[index]['original_name'] !=null?tvshows[index]['original_name']:'loading',
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
