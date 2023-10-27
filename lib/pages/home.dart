import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pacex/model/category_model.dart';
import 'package:pacex/model/slider_model.dart';
import 'package:pacex/services/data.dart';
import 'package:pacex/services/slider_data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<sliderModel> sliders = [];
  @override
  void initState() {
    categories = getCategories();
    sliders = getSliders();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text('PACE'),
            Text(
              "X",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(children: [
          Container(
              margin: const EdgeInsets.only(left: 10.0),
              height: 70,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    image: categories[index].image,
                    categoryName: categories[index].categoryName,
                  );
                },
              )),
       SizedBox(height: 30.0,),
       CarouselSlider.builder(
              itemCount: sliders.length,
              itemBuilder: (context, index, realIndex) {
                String? res = sliders[index].image;
                String? res1 = sliders[index].name;
                return buildImage(res!, index, res1!);
              },
              options: CarouselOptions(
                height: 250,
                viewportFraction: 1,
                autoPlay: true,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height),),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String image, int index, String name) => Container(
    margin:const EdgeInsets.symmetric(horizontal: 5.0),
    child: Stack(
      children: [
      ClipRRect(
      borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          image,
          height: 250,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        ),
      ),
      Container(
        height: 250,
        padding: const EdgeInsets.only(left: 40.0),
        margin: const EdgeInsets.only(top:130.0),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),),),
        child: Text(name, style: const TextStyle(color: Colors.white, fontSize: 20.0,fontWeight: FontWeight.bold),),
      )
   ], ),);
}



class CategoryTile extends StatelessWidget {
  final image, categoryName;
  CategoryTile({this.categoryName, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              image,
              width: 120,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 120,
            height: 60,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
            color: Colors.black26,
            child: Text(
              categoryName,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
