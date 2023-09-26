import 'package:e_revive_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_controller.dart';

import 'package:e_revive_app/constants/global_variables.dart';
class InfoScreen extends StatefulWidget {
  static const String routeName='/info';
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  List imageList = [
    {"id": 1, "image_path": 'assets/robot-with-trash-recycle-symbol.jpg'},
    {"id": 2, "image_path": 'assets/recycle-items-brown-wooden-textured-background.jpg'},
    {"id": 3, "image_path": 'assets/20944237.jpg'}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final user =Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Container(
                child: Text("E-Revive",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300),),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("Hello ",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w400),),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(user.name,style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w400),),
                  ),
                ],
              ),
            ],
          ),
        ),

      ),

      body: Column(children: [
        Stack(
          children: [
            InkWell(
              onTap: () {
                print(currentIndex);
              },
              child: CarouselSlider(
                items: imageList
                    .map(
                      (item) => Image.asset(
                    item['image_path'],
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                )
                    .toList(),
                carouselController: carouselController,
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child: Container(
                      width: currentIndex == entry.key ? 17 : 7,
                      height: 7.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 3.0,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentIndex == entry.key
                              ? Colors.red
                              : Colors.teal),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),

      ]),
    );
  }
}