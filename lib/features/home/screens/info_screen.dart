import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class InfoScreen extends StatefulWidget {
  static const String routeName = '/info';

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final List<String> eWasteFacts = [
    'E-waste is the fastest growing waste stream in the world.',
    'Only 20% of e-waste is recycled globally.',
    'E-waste contains toxic chemicals that can pollute the environment and harm human health.',
    'E-waste can be recycled to recover valuable materials such as gold, silver, and copper.',
    'We all have a role to play in reducing e-waste by repairing, reusing, and recycling our electronic devices.'
  ];

  final List<String> eWasteImages = [
    'assets/helloo.jpg',
    'assets/john-cameron-7zocFMzvbpc-unsplash.jpg',
    'assets/recycle-items-brown-wooden-textured-background.jpg',
  ];

  final List<String> eWasteVideos = [
    'eT34ypRodB0',
    'Vs69ZZJ0CWM',
    'bjuk983LhKs',
  ];

  int _currentSlideIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Waste Info'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Carousel slider with e-waste images
            CarouselSlider(
              items: eWasteImages.map((image) {
                return Image.asset(
                  image,
                  fit: BoxFit.cover,
                );
              }).toList(),
              options: CarouselOptions(
                height: 250.0,
                autoPlay: true,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentSlideIndex = index;
                  });
                },
              ),
            ),
            // Row of dots to indicate the current slide
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(eWasteImages.length, (index) {
                return Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: _currentSlideIndex == index ? Colors.blue : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  width: 8.0,
                  height: 8.0,
                );
              }),
            ),
            // List of e-waste facts with icons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: eWasteFacts.map((fact) {
                  return ListTile(
                    leading: Icon(FontAwesomeIcons.checkCircle, color: Colors.blue),
                    title: Text(fact, style: GoogleFonts.roboto(fontSize: 16.0)),
                  );
                }).toList(),
              ),
            ),
            // List of e-waste videos with thumbnails
            Column(
              children: eWasteVideos.map((videoId) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                  child: Card(
                    elevation: 4.0,
                    child: YoutubePlayer(
                      bottomActions: [
                        CurrentPosition(),
                        ProgressBar(
                          isExpanded: true,
                          colors: const ProgressBarColors(
                            playedColor: Colors.amber,
                            handleColor: Colors.amberAccent,
                          ),
                        ),
                        const PlaybackSpeedButton(),

                      ],
                      controller: YoutubePlayerController(
                        initialVideoId: videoId,

                        flags: YoutubePlayerFlags(
                          autoPlay: false,

                          mute: false,
                        ),

                      ),
                      showVideoProgressIndicator: true,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
