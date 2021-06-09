import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies_imdb_app/text.dart';

class Description extends StatelessWidget {
  final String name, description,bannerurl, posterurl, vote, launch_on;

  const Description({Key key, this.name, this.description, this.bannerurl, this.posterurl, this.vote, this.launch_on}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(child: Container(
                   height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                        child: Image.network(bannerurl, fit: BoxFit.fill,)),

                  ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: ModifiedText(text: "⭐ Average Rating - "+vote, size: 18.0, color: Colors.white,),)
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.all(10),
              child: ModifiedText(text:  name!= null? name:"Not Loaded", size: 24,),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: ModifiedText(text: 'Releasing On - '+launch_on,size: 15,),
            ),
            Row(
              children: [
                Container(
                 height: 200,
                  width: 150,
                  margin: EdgeInsets.all(5),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(9),
                      child: Image.network(posterurl, fit: BoxFit.fill, )),

                ),
                Flexible(
                  child: Container(
                    child: ModifiedText(text: description, size: 18,),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
