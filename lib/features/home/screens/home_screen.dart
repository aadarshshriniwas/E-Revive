import 'package:e_revive_app/features/home/screens/info_screen.dart';
import 'package:e_revive_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:math';
import 'package:e_revive_app/features/Map/map_screen.dart';
import 'package:e_revive_app/constants/global_variables.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> randomTextOptions = [
    'Rapid Growth: The generation of e-waste has been growing at an alarming rate worldwide. According to the Global E-waste Statistics Partnership, approximately 53.6 million metric tons of e-waste were generated globally in 2019, and this number is expected to increase by 21% by 2030. E-waste contains valuable resources such as gold, silver, and rare earth metals. Proper recycling and recovery of these materials can reduce the need for mining and help conserve natural resources.',
    'Recycling: Proper e-waste recycling involves dismantling electronic devices to recover valuable materials and dispose of hazardous components safely. Many countries have established e-waste recycling programs and collection centers. Legislation and Regulation: Governments worldwide are implementing laws and regulations to control the disposal and management of e-waste. These laws often require manufacturers to take responsibility for the proper disposal and recycling of their products.',
  ];

  @override
  Widget build(BuildContext context) {
    int randomIndex = Random().nextInt(randomTextOptions.length);

    Future.delayed(Duration(seconds: 5)).then((_) {
      showDialog(
          context: context,
          builder: (context) => SizedBox(
        height: 100,
        width: 100,
        child: AlertDialog(
          title: Text('Did you know it?'),
          content: Column(
            children: [
              Image.asset('assets/helloo.jpg'),
              SizedBox(height: 18,),
              Text(randomTextOptions[randomIndex]),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Got it'),
            ),
          ],
        ),
          ),
      );
    });
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: GlobalVariables.appBarGradient,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "E-Revive",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Hello ",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  user.name,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/background_image.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Got E-waste?',
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'You came to the right place!',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                aspectRatio: 3.0,
              ),
              items: [
                Image.asset('assets/20944237.jpg', fit: BoxFit.cover),
                Image.asset('assets/assortment-dirty-dumped-objects (1).jpg', fit: BoxFit.cover),
                Image.asset('assets/robot-with-trash-recycle-symbol.jpg', fit: BoxFit.cover),
                Image.asset('assets/helloo.jpg', fit: BoxFit.cover),
                Image.asset('assets/john-cameron-7zocFMzvbpc-unsplash.jpg', fit: BoxFit.cover),
                // Add more images or videos here
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text('Know E-waste'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoScreen()),
                    );
                  },
                ),
                ElevatedButton(
                  child: Text('Recycle Now'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MapPage()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 85),
            Center(
              child: InkWell(

                child: Text(
                  "Learn more about Team E-Revive",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
