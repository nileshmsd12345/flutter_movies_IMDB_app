import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies_imdb_app/description.dart';
import 'package:flutter_movies_imdb_app/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key key, this.trending}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text:"Trending Movies", size: 21 ,),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
              shrinkWrap: false,
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
                itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Description(name: trending[index]['title'], bannerurl:'http://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'] ,posterurl: 'http://image.tmdb.org/t/p/w500'+trending[index]['poster_path'], description: trending[index]['overview'],
                    vote: trending[index]['vote_average'].toString(), launch_on: trending[index]['release_date'],)));
                  },
                  child: trending[index]['title']!= null?
                  Container(
                    width: 200,
                    child: Column(

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            height: 150,
                            width: 250,
                            decoration: BoxDecoration(image: DecorationImage(
                                    image: NetworkImage(
                                      'http://image.tmdb.org/t/p/w500'+trending[index]['poster_path'],

                                    ),
                              fit: BoxFit.cover,
                            ),
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: ModifiedText(
                            text: trending[index]['title'] !=null?trending[index]['title']:'loading',
                          ),
                        ),
                      ],
                    ),
                  )
                  : Container(),
                );
                }
            ),
          )
        ],
      ),
    );
  }
}
