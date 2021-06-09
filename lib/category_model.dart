class CategoryModel {
  String imageUrl;
  String categoryName;

  CategoryModel({this.categoryName, this.imageUrl});
}

////The List for the category

List<CategoryModel> getCategory() {
  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel = new CategoryModel();

//1
  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Action';
  categoryModel.imageUrl = 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/action-movies-1-1591802654.jpg?crop=0.502xw:1.00xh;0.250xw,0&resize=640:*';
  category.add(categoryModel);
//2
  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Romance';
  categoryModel.imageUrl = 'https://images.saymedia-content.com/.image/t_share/MTc0NDA1NzQ2OTIxMDU1ODc4/-movies-like-the-notebook.jpg';
  category.add(categoryModel);
  //3
  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Horror';
  categoryModel.imageUrl = 'https://images.indianexpress.com/2020/10/underrated-horror-1200.jpg';
  category.add(categoryModel);
  //4
  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Drama';
  categoryModel.imageUrl = 'https://image.slidesharecdn.com/genredrama-111022160431-phpapp02/95/conventions-of-drama-films-1-728.jpg?cb=1319299505';
  category.add(categoryModel);
  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Si-fi';
  categoryModel.imageUrl = 'https://www.simandan.com/wp-content/uploads/2011/03/the-matrix-review_.jpg';
  category.add(categoryModel);
  //6
  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Comedy';
  categoryModel.imageUrl = 'https://i.pinimg.com/originals/22/91/cb/2291cb462e2e33ece794c094b684fe5e.jpg';
  category.add(categoryModel);
  //7
  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Thriller';
  categoryModel.imageUrl = 'https://i1.wp.com/bestoftheyear.in/wp-content/uploads/2018/04/Hollywood-Suspense-thriller-movies.png?fit=753%2C459&ssl=1';
  category.add(categoryModel);
  //8
  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Animation';
  categoryModel.imageUrl = 'https://hitechanimation.files.wordpress.com/2018/07/animated-movies.jpg?w=778&h=438';
  category.add(categoryModel);
  //9
  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'War';
  categoryModel.imageUrl = 'https://thefederal.com/file/2020/05/pjimage-13-696x421.jpg  ';
  category.add(categoryModel);
  //10
  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Adventure';
  categoryModel.imageUrl = 'https://www.lifeofadventure.com/wp-content/uploads/2008/10/best_adventure_films_500px.jpg';
  category.add(categoryModel);

  return category;
}
