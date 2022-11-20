import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bookmaker/models/core/recipe.dart';
import 'package:bookmaker/models/helper/recipe_helper.dart';
import 'package:bookmaker/views/screens/search_page.dart';
import 'package:bookmaker/views/utils/AppColor.dart';
import 'package:bookmaker/views/widgets/category_card.dart';
import 'package:bookmaker/views/widgets/popular_recipe_card.dart';
import 'package:bookmaker/views/widgets/recommendation_recipe_card.dart';

class ExplorePage extends StatelessWidget {
  final Recipe popularRecipe = RecipeHelper.popularRecipe;
  final List<Recipe> sweetFoodRecommendationRecipe =
      RecipeHelper.sweetFoodRecommendationRecipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        elevation: 0,
        centerTitle: false,
        title: Text('Explore Recipe',
            style: TextStyle(
                fontFamily: 'inter',
                fontWeight: FontWeight.w400,
                fontSize: 16)),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SearchPage()));
            },
            icon: SvgPicture.asset('assets/icons/search.svg',
                color: Colors.white),
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          // Section 1 - Category
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            width: MediaQuery.of(context).size.width,
            height: 245,
            color: AppColor.primary,
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                CategoryCard(
                    title: 'Football',
                    image: AssetImage('assets/images/cat-football.jpg')),
                CategoryCard(
                    title: 'Rugby',
                    image: AssetImage('assets/images/cat-rugby.jpg')),
                CategoryCard(
                    title: 'Tennis',
                    image: AssetImage('assets/images/cat-tennis.jpg')),
                CategoryCard(
                    title: 'Hockey',
                    image: AssetImage('assets/images/cat-hockey.jpg')),
                CategoryCard(
                    title: 'Basketball',
                    image: AssetImage('assets/images/cat-basketball.jpg')),
                CategoryCard(
                    title: 'Handball',
                    image: AssetImage('assets/images/cat-handball.jpg')),
              ],
            ),
          ),
          // Section 2 - Popular Card
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: PopularRecipeCard(
              data: popularRecipe,
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Les pronos du jour',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'inter'),
                  ),
                ),
                // Content
                Container(
                  height: 174,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: sweetFoodRecommendationRecipe.length,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 16);
                    },
                    itemBuilder: (context, index) {
                      return RecommendationRecipeCard(
                          data: sweetFoodRecommendationRecipe[index]);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
