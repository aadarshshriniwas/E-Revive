import 'package:e_revive_app/features/home/screens/info_screen.dart';
import 'package:e_revive_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:e_revive_app/constants/global_variables.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName='/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                    child: Text("Hello ",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w400,),),
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

      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 22,),

              Padding(
                padding: const EdgeInsets.only(left: 8,right: 0,top: 0,bottom: 0),
                child: Text('Got E-waste?',
                  style: TextStyle(
                    fontSize: 40.0,
                    color:GlobalVariables.secondaryColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 0,top: 0,bottom: 0),
                child: Text('You came at the right place!',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black,
                  ),
                ),
              ),
SizedBox(height: 30,),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1.0,
                  aspectRatio: 3.0,

                ),
                items: [
                  Image.asset('assets/recycle-items-brown-wooden-textured-background.jpg'),
                  Image.asset('assets/20944237.jpg'),
                  Image.asset('assets/robot-with-trash-recycle-symbol.jpg'),
                  //Image.asset('assets/helloo.jpg'),
                  // Add more images or videos here
                ],
              ),
             Row(

                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: Text('Know E-waste'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => InfoScreen()),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: Text('Recycle Now'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InfoScreen()),
                        );
                      },
                    ),
                  ),

                ],
              ),
              SizedBox(height: 250,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Team E-Revive"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
