import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies_imdb_app/text.dart';
import 'package:flutter_movies_imdb_app/description.dart';

class TopRatedMovies extends StatelessWidget {
  final List topRated;

  const TopRatedMovies({Key key, this.topRated}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text:"Top Rated Movies", size: 21 ,),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 190,
            child: ListView.builder(
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                itemCount: topRated.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Description(name: topRated[index]['original_title'], bannerurl:'http://image.tmdb.org/t/p/w500'+topRated[index]['backdrop_path'] ,posterurl: 'http://image.tmdb.org/t/p/w500'+topRated[index]['poster_path'], description: topRated[index]['overview'],
                        vote: topRated[index]['vote_average'].toString(), launch_on: topRated[index]['release_date'],)));
                    },
                    child: Container(
                      width: 200,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              
                              height: 140,
                              width: 250,
                              decoration: BoxDecoration(

                                image: DecorationImage(
                                image: NetworkImage(
                                  'http://image.tmdb.org/t/p/w500'+topRated[index]['poster_path'],
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
                              text: topRated[index]['title'] !=null?topRated[index]['title']:'loading',
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
