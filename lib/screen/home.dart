import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_movies_imdb_app/category_model.dart';
import 'package:flutter_movies_imdb_app/movieModel.dart';
import 'package:flutter_movies_imdb_app/text.dart';
import 'package:flutter_movies_imdb_app/widgets/topRatedMovies.dart';
import 'package:flutter_movies_imdb_app/widgets/trendingMovies.dart';
import 'package:flutter_movies_imdb_app/widgets/tvs.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> category = new List<CategoryModel>();
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];
  final String apiKey = '02fead75b2be232ee92893d69fb501c6';
  final accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwMmZlYWQ3NWIyYmUyMzJlZTkyODkzZDY5ZmI1MDFjNiIsInN1YiI6IjYwYjJmMzdjYWFmZWJkMDA3ODBmMjQ3YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.mKeMebjlMw9Lc_a6bsOFcjBDSl4H--jjSvXP6pi00Xs';
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    category = getCategory();
    loadMovies();
    print(trendingMovies);
  }

  loadMovies() async {
    TMDB tmdbWithCustomlogs = TMDB(ApiKeys(apiKey, accessToken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    Map trendingResults = await tmdbWithCustomlogs.v3.trending.getTrending();
    Map topRatedResults = await tmdbWithCustomlogs.v3.movies.getTopRated();
    Map tvResults = await tmdbWithCustomlogs.v3.tv.getPouplar();
    setState(() {
      trendingMovies = trendingResults['results'];
      topRatedMovies = topRatedResults['results'];
      tv = tvResults['results'];
      _loading = false;
    });

    // print(tv);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 25,
        backgroundColor: Colors.black87,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ModifiedText(
                  text: "Flutter",
                  color: Colors.lightBlueAccent,
                ),
                ModifiedText(
                  text: "IMDB",
                  color: Colors.redAccent,
                ),
              ],
            ),
            SizedBox(height: 10.0),
          ],
        ),
        elevation: 1.0,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: [
                        //Category
                        Container(
                          height: 90,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: category.length,
                              itemBuilder: (context, index) {
                                return CategoryTile(
                                  categoryName: category[index].categoryName,
                                  imageUrl: category[index].imageUrl,
                                );
                              }),
                        ),
                        TvShows(
                          tvshows: tv,
                        ),
                        TopRatedMovies(
                          topRated: topRatedMovies,
                        ),
                        TrendingMovies(
                          trending: trendingMovies,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imageUrl;
  final String categoryName;
  CategoryTile({this.categoryName, this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                imageUrl,
                width: 120,
                height: 90,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black12,
              ),
              child: Text(
                categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
