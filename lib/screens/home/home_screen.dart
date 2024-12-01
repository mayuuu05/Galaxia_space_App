import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

import '../detail/detai_screen.dart';

class PlanetSlider extends StatefulWidget {
  const PlanetSlider({Key? key}) : super(key: key);

  @override
  State<PlanetSlider> createState() => _PlanetSliderState();
}

class _PlanetSliderState extends State<PlanetSlider>
    with SingleTickerProviderStateMixin {
  double currentAngle = 4;
  int selectedPlanetIndex = 1;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  final List<String> planets = [
    'Moon',
    'Sun',
    'Mercury',
    'Venus',
    'Earth',
    'Mars',
    'Jupiter',
    'Saturn',
    'Uranus',
    'Neptune',
    'Pluto',
  ];

  final List<String> planetImages = [
    'assets/images/half moon.png',
    'assets/images/sun.jpg',
    'assets/images/half mercury.png',
    'assets/images/half venus.png',
    'assets/images/e.jpg',
    'assets/images/mars.png',
    'assets/images/Jupiter.webp',
    'assets/images/Saturn.jpg',
    'assets/images/uranus half.webp',
    'assets/images/Neptune.webp',
    'assets/images/pluto.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  void _onSwipe(DragUpdateDetails details) {
    setState(() {
      currentAngle += details.delta.dx * 0.01;
    });
  }

  void _onPlanetTap(int index) {
    setState(() {
      selectedPlanetIndex = index;
      _controller.reset();
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final radius = 150.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                BounceInUp(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 110),
                    child: Center(
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: Transform.rotate(
                          angle: pi / 2,
                          child: Text(
                            planets[selectedPlanetIndex],
                            style: TextStyle(
                                fontSize: 60, fontWeight: FontWeight.w100),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ZoomIn(
                  child: Container(
                    margin: EdgeInsets.only(left: 30, top: 200),
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/Screenshot 2024-11-26 123217.png',
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),


                Positioned(
                  left: 110,
                  top: 250,
                  child: GestureDetector(
                    onTap: () {


                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetaiScreen(selectedPlanetIndex: selectedPlanetIndex),
                        ),
                      );
                    },
                    child: Hero(
                      tag: 'planet',
                      child: ZoomIn(
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 77,
                          backgroundImage: AssetImage(
                            planetImages[selectedPlanetIndex],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 400,
              left: 70,
              child: Center(
                child: Text(
                  'Galaxia',
                  style: GoogleFonts.orbitron(
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  SizedBox(height: 100),
                  GestureDetector(
                    onHorizontalDragUpdate: _onSwipe,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SlideInDown(
                          child: CustomPaint(
                            size: Size(2 * radius, 2 * radius),
                            painter: CircularArcPainter(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 140),
                          child: ZoomIn(
                            child: Text(
                              planets[selectedPlanetIndex],
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        ...List.generate(planets.length, (index) {
                          final angle =
                              (2 * pi / planets.length) * index + currentAngle;
                          final x = radius * cos(angle);
                          final y = radius * sin(angle);

                          return Transform.translate(
                            offset: Offset(x, y),
                            child: GestureDetector(

                              onTap: () => _onPlanetTap(index),
                              child: SlideInUp(
                                child: CircleAvatar(
                                  radius: index == selectedPlanetIndex ? 20 : 15,
                                  backgroundColor: index == selectedPlanetIndex
                                      ? Colors.blue
                                      : Colors.orange,
                                  child: Text(
                                    planets[index][0],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),

                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CircularArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );
    canvas.drawArc(rect, 0, 2 * pi, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
