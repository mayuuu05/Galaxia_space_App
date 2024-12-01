import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:space_app_galaxia/screens/detail/detail2.dart';

class DetaiScreen extends StatefulWidget {
  final int selectedPlanetIndex;


  const DetaiScreen({Key? key, required this.selectedPlanetIndex}) : super(key: key);

  @override
  State<DetaiScreen> createState() => _DetaiScreenState();
}

class _DetaiScreenState extends State<DetaiScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  final List<Map<String, String>> planetDetails = [
    {
      'title': 'Moon',
      'description':
          "The Moon is Earth's only natural satellite, orbiting at an average distance of 384,400 km. It influences tides and has been a key target in space exploration.",
      'image': 'assets/images/full moon.png',
    },
    {
      'title': 'Sun',
      'description':
          "The Sun is the star at the center of the Solar System. It is a nearly perfect sphere of hot plasma and provides the energy necessary for life on Earth.",
      'image': 'assets/images/full sun.png',
    },
    {
      'title': 'Mercury',
      'description':
          "Mercury is the closest planet to the Sun and the smallest in the Solar System. It has no atmosphere and experiences extreme temperatures.",
      'image': 'assets/images/full_mercury.png',
    },
    {
      'title': 'Venus',
      'description':
          "Venus is the second planet from the Sun and is known for its thick, toxic atmosphere. It is often called Earth's 'sister planet' due to its similar size.",
      'image': 'assets/images/full venus.png',
    },
    {
      'title': 'Earth',
      'description':
          "Earth is the third planet from the Sun and the only known planet to support life. It has a diverse climate and a protective atmosphere.",
      'image': 'assets/images/earth.png',
    },
    {
      'title': 'Mars',
      'description':
          "Mars is the fourth planet from the Sun and is often referred to as the 'Red Planet' due to its reddish appearance. It has the tallest volcano in the Solar System.",
      'image': 'assets/images/full mars.png',
    },
    {
      'title': 'Jupiter',
      'description':
          "Jupiter is the largest planet in the Solar System, known for its Great Red Spot, a massive storm. It has over 79 moons, including the largest, Ganymede.",
      'image': 'assets/images/jupiter_full.png',
    },
    {
      'title': 'Saturn',
      'description':
          "Saturn is the sixth planet from the Sun and is famous for its prominent ring system. It is a gas giant primarily composed of hydrogen and helium.",
      'image': 'assets/images/full_saturn.png',
    },
    {
      'title': 'Uranus',
      'description':
          "Uranus is the seventh planet from the Sun and has a unique tilt, rotating on its side. It is known for its pale blue color and icy atmosphere.",
      'image': 'assets/images/Uranus full.png',
    },
    {
      'title': 'Neptune',
      'description':
          "Neptune is the eighth and farthest planet from the Sun. It has a deep blue color and is known for its strong winds and dark storms.",
      'image': 'assets/images/full_Neptune.png',
    },
    {
      'title': 'Pluto',
      'description':
          "Pluto, once considered the ninth planet, is now classified as a dwarf planet. It orbits beyond Neptune in the Kuiper Belt.",
      'image': 'assets/images/full_pluto.png',
    }
  ];
  int currentPlanetIndex = 0;

  @override
  void initState() {
    super.initState();
    currentPlanetIndex = widget.selectedPlanetIndex;
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override





  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: PageController(initialPage: currentPlanetIndex),
        itemCount: planetDetails.length,
        onPageChanged: (index) {
          setState(() {
            currentPlanetIndex = index;
          });
        },
        itemBuilder: (context, index) {
          final planet = planetDetails[index];
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Center(
                    child: FadeIn(
                      child: Text(
                        planet['title']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 50,horizontal: 30
                  ),
                  child: FadeInUpBig(
                    child: Text(
                      planet['description']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 220,),
                FadeInDownBig(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detail2(planetIndex: index),
                          ),
                        );
                      },
                      child: Hero(
                        tag: planet['title']!,
                        child: AnimatedBuilder(
                          animation: animationController,
                          builder: (context, child) => RotationTransition(
                            turns: animationController,
                            child: Container(

                              height: 450,
                              width: 450,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(planet['image']!),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

