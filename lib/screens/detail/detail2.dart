import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class Detail2 extends StatefulWidget {
  final int planetIndex;

  const Detail2({super.key, required this.planetIndex});

  @override
  State<Detail2> createState() => _Detail2State();
}

class _Detail2State extends State<Detail2> with SingleTickerProviderStateMixin {
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

  final planetDetails = [
    {
      'title': 'Moon',
      'discoverImg': 'assets/images/d2_moon.jpg',
      'discover': "The Moon is Earth's only natural satellite. It is about one-quarter the diameter of Earth and is similar in size to the planet Mercury.",
      'discoverDetail2': "The Moon is thought to have formed around 4.51 billion years ago, shortly after Earth. The most widely accepted explanation is the giant-impact hypothesis.",
      'history': "The Moon has been a source of fascination and inspiration for humans throughout history. It has played a significant role in myths, legends, and calendars in various cultures.",
      'historyDetail2': "In 1969, the Apollo 11 mission made history by landing humans on the Moon for the first time. Astronauts Neil Armstrong and Buzz Aldrin became the first to walk on its surface.",
      'historyImg': "assets/images/history.jpg",
      'diagram': "The Moon has a unique structure consisting of its crust, mantle, and core. Below is a simplified diagram to illustrate its composition.",
      'diagramDetail2': "1. Diameter: 3,474 km\n"
          "2. Gravity: 1/6th of Earth's\n"
          "3. Distance from Earth: ~384,400 km\n"
          "4. Surface: Covered with craters and maria (dark basaltic plains).",
      'diagramImg': 'assets/images/diagram.jpg'
    },
    {
      'title': 'Sun',
      'discoverImg': 'assets/images/sun discover.jpg',
      'discover': "The Sun is the star at the center of our Solar System. It provides the energy that sustains life on Earth.",
      'discoverDetail2': "The Sun has been known since ancient times, and its nature was studied by early astronomers. Its structure and composition have been explored in-depth by modern science.",
      'history': "The Sun has been crucial to various cultures, with many ancient civilizations worshipping it as a deity. It was first scientifically studied by astronomers such as Galileo and Johannes Kepler.",
      'historyDetail2': "In the 20th century, scientists discovered that the Sun’s energy is produced through nuclear fusion, a process where hydrogen atoms are fused to form helium at the Sun’s core.",
      'historyImg': "assets/images/sun history.jpg",
      'diagram': "The Sun is composed of several layers, including the core, radiative zone, convective zone, photosphere, chromosphere, and corona.",
      'diagramDetail2': "1. Diameter: 1,391,000 km\n"
          "2. Gravity: 28 times Earth's\n"
          "3. Distance from Earth: ~149.6 million km (1 AU)\n"
          "4. Surface: Visible surface called the photosphere, with sunspots and solar flares.",
      'diagramImg': 'assets/images/sun diagram.jpg'
    },
    {
      'title': 'Mercury',
      'discoverImg': 'assets/images/mercury discover.jpg',
      'discover': "Mercury is the closest planet to the Sun and the smallest in the Solar System.",
      'discoverDetail2': "Mercury was known to ancient civilizations, but it was first properly observed with telescopes in the 17th century.",
      'history': "Mercury has been studied by many astronomers, and its proximity to the Sun made it difficult to observe from Earth.",
      'historyDetail2': "NASA's Mariner 10 was the first spacecraft to visit Mercury in 1974, followed by MESSENGER in 2011.",
      'historyImg': "assets/images/Mercury history.webp",
      'diagram': "Mercury has a rocky surface and is heavily cratered, with no atmosphere to protect it.",
      'diagramDetail2': "1. Diameter: 4,880 km\n"
          "2. Gravity: 0.38 times Earth's\n"
          "3. Distance from Sun: ~57.9 million km\n"
          "4. Surface: Cratered rocky terrain with extreme temperature variations.",
      'diagramImg': 'assets/images/Mercury diagram.jpg'
    },
    {
      'title': 'Venus',
      'discoverImg': 'assets/images/Venus discover.jpg',
      'discover': "Venus is the second planet from the Sun and is often called Earth's 'sister planet' because of their similar size.",
      'discoverDetail2': "Venus was known to ancient civilizations, but it was first studied in depth by astronomers in the 17th century.",
      'history': "Venus has been observed for centuries, but its dense atmosphere made it difficult to study until space missions.",
      'historyDetail2': "NASA's Magellan spacecraft mapped Venus' surface in the 1990s, revealing its volcanic terrain and thick clouds.",
      'historyImg': "assets/images/Venus history.jpg",
      'diagram': "Venus has a thick atmosphere made of carbon dioxide, and its surface is extremely hot and volcanic.",
      'diagramDetail2': "1. Diameter: 12,104 km\n"
          "2. Gravity: 0.9 times Earth's\n"
          "3. Distance from Sun: ~108.2 million km\n"
          "4. Surface: Hot, rocky with volcanoes and thick clouds.",
      'diagramImg': 'assets/images/Venus diagram.png'
    },
    {
      'title': 'Earth',
      'discoverImg': 'assets/images/Earth discover.jpg',
      'discover': "Earth is the third planet from the Sun and the only known planet to support life.",
      'discoverDetail2': "Earth has been known since ancient times, and scientific studies began to reveal its structure and composition.",
      'history': "Earth has been a subject of study for millennia, with advancements in geology, biology, and astronomy shedding light on its nature.",
      'historyDetail2': "The first human-made satellites and manned missions to space have further increased our understanding of Earth and its place in the universe.",
      'historyImg': "assets/images/Earth history.jpg",
      'diagram': "Earth has a solid core, a mantle, and a crust. It is covered by oceans and continents with a diverse atmosphere.",
      'diagramDetail2': "1. Diameter: 12,742 km\n"
          "2. Gravity: 1 times Earth's\n"
          "3. Distance from Sun: ~149.6 million km\n"
          "4. Surface: Oceans, continents, atmosphere, and life.",
      'diagramImg': 'assets/images/Earth diagram.jpg'
    },
    {
      'title': 'Mars',
      'discoverImg': 'assets/images/Mars discover.jpg',
      'discover': "Mars is the fourth planet from the Sun and is known as the 'Red Planet' due to its reddish appearance.",
      'discoverDetail2': "Mars has been observed since ancient times, and it was first visited by spacecraft in the 1960s.",
      'history': "Mars has been the focus of numerous space missions aimed at discovering whether it ever supported life.",
      'historyDetail2': "NASA's rovers, including Curiosity and Perseverance, have provided detailed data about Mars' surface and atmosphere.",
      'historyImg': "assets/images/Mars history.webp",
      'diagram': "Mars has a rocky surface with mountains, valleys, and ice caps, and its thin atmosphere is mostly carbon dioxide.",
      'diagramDetail2': "1. Diameter: 6,779 km\n"
          "2. Gravity: 0.38 times Earth's\n"
          "3. Distance from Sun: ~227.9 million km\n"
          "4. Surface: Rocky terrain with mountains, valleys, and polar ice caps.",
      'diagramImg': 'assets/images/Mars diagram.jpg'
    },
    {
      'title': 'Jupiter',
      'discoverImg': 'assets/images/Jupiter discover.webp',
      'discover': "Jupiter is the fifth and largest planet in the Solar System, known for its Great Red Spot.",
      'discoverDetail2': "Jupiter has been known since ancient times, and it was studied in more detail with the invention of the telescope.",
      'history': "Jupiter's massive size and strong magnetic field make it an important subject of study in space exploration.",
      'historyDetail2': "NASA's Juno spacecraft continues to study Jupiter's atmosphere and magnetic field.",
      'historyImg': "assets/images/Jupiter history.jpg",
      'diagram': "Jupiter is a gas giant with a thick atmosphere, a core made of metal and rock, and many moons and rings.",
      'diagramDetail2': "1. Diameter: 139,820 km\n"
          "2. Gravity: 2.5 times Earth's\n"
          "3. Distance from Sun: ~778.3 million km\n"
          "4. Surface: Thick clouds, strong winds, and a magnetic field.",
      'diagramImg': 'assets/images/Diagram-cloud-structure-Jupiter-core.webp'
    },
    {
      'title': 'Saturn',
      'discoverImg': 'assets/images/Saturn discover.jpg',
      'discover': "Saturn is the sixth planet from the Sun, known for its stunning ring system.",
      'discoverDetail2': "Saturn has been known since ancient times, and its rings were first observed by Galileo in the early 1600s.",
      'history': "Saturn has been a focus of space exploration, with NASA's Cassini spacecraft providing valuable insights into its rings and moons.",
      'historyDetail2': "NASA's Cassini spacecraft orbited Saturn for 13 years, studying its rings, moons, and atmosphere.",
      'historyImg': "assets/images/Saturn history.webp",
      'diagram': "Saturn is a gas giant with a massive ring system, and it has many moons, including Titan.",
      'diagramDetail2': "1. Diameter: 116,460 km\n"
          "2. Gravity: 1.07 times Earth's\n"
          "3. Distance from Sun: ~1.43 billion km\n"
          "4. Surface: Cloudy atmosphere and prominent rings.",
      'diagramImg': 'assets/images/Saturn diagram.jpg'
    },
    {
      'title': 'Uranus',
      'discoverImg': 'assets/images/Uranus discover.webp',
      'discover': "Uranus is the seventh planet from the Sun, known for its unusual tilt.",
      'discoverDetail2': "Uranus was discovered in 1781 by Sir William Herschel.",
      'history': "Uranus has been studied for centuries, with its rings and moons observed by several spacecraft.",
      'historyDetail2': "NASA's Voyager 2 spacecraft flew by Uranus in 1986, providing valuable data about its rings and moons.",
      'historyImg': "assets/images/Uranus history.jpg",
      'diagram': "Uranus has a cold atmosphere made of hydrogen, helium, and methane, and it rotates on its side.",
      'diagramDetail2': "1. Diameter: 50,724 km\n"
          "2. Gravity: 0.89 times Earth's\n"
          "3. Distance from Sun: ~2.9 billion km\n"
          "4. Surface: Cold atmosphere with faint rings.",
      'diagramImg': 'assets/images/A.jpg'
    },
    {
      'title': 'Neptune',
      'discoverImg': 'assets/images/Neptune discover.webp',
      'discover': "Neptune is the eighth planet from the Sun, known for its deep blue color.",
      'discoverDetail2': "Neptune was discovered in 1846 by Johann Galle.",
      'history': "Neptune has been observed for over a century, with space missions providing a deeper understanding of its atmosphere and moons.",
      'historyDetail2': "NASA's Voyager 2 flew by Neptune in 1989, providing detailed images of its surface and storm systems.",
      'historyImg': "assets/images/Neptune history.jpg",
      'diagram': "Neptune has a stormy atmosphere and is known for its high-speed winds and a large storm known as the Great Dark Spot.",
      'diagramDetail2': "1. Diameter: 49,244 km\n"
          "2. Gravity: 1.14 times Earth's\n"
          "3. Distance from Sun: ~4.5 billion km\n"
          "4. Surface: Deep blue atmosphere with intense winds and storms.",
      'diagramImg': 'assets/images/Neptune_diagram.jpg'
    },
    {
      'title': 'Pluto',
      'discoverImg': 'assets/images/Pluto discover.jpg',
      'discover': "Pluto was once considered the ninth planet from the Sun but is now classified as a dwarf planet. It is known for its small size and distant orbit.",
      'discoverDetail2': "Pluto was discovered in 1930 by Clyde Tombaugh. Its status as a planet was debated until it was reclassified as a dwarf planet by the IAU in 2006.",
      'history': "Pluto has intrigued astronomers for decades due to its eccentric orbit and small size. The New Horizons mission in 2015 provided the first detailed images of the dwarf planet.",
      'historyDetail2': "The New Horizons spacecraft made a historic flyby of Pluto in 2015, sending back stunning images and data that revealed its surface and atmosphere.",
      'historyImg': "assets/images/Pluto history.webp",
      'diagram': "Pluto has a rocky core surrounded by a mantle of water ice and a thin atmosphere. Its surface is covered with plains and mountains made of ice.",
      'diagramDetail2': "1. Diameter: 2,377 km\n"
          "2. Gravity: 0.06 times Earth's\n"
          "3. Distance from Sun: ~5.9 billion km\n"
          "4. Surface: Ice-covered plains, mountains, and a thin atmosphere.",
      'diagramImg': 'assets/images/Pluto diagram.jpg'
    }
  ];


  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentPlanet = planetDetails[widget.planetIndex];
    final currentImage = planetImages[widget.planetIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          FadeInUpBig(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(currentImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
            tabs: const [
              Tab(text: 'DISCOVER'),
              Tab(text: 'HISTORY'),
              Tab(text: 'DIAGRAM'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildDiscoverTab(currentPlanet),
                _buildHistoryTab(currentPlanet),
                _buildDiagramTab(currentPlanet),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiscoverTab(Map<String, dynamic> planet) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInUpBig(
              child: Text(
                'The ${planet['title']}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            FadeInUpBig(
              child: Text(
                planet['discover'],
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            Image.asset(
              planet['discoverImg'],
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              "Formation",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            FadeInUpBig(
              child: Text(
                planet['discoverDetail2'],
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryTab(Map<String, dynamic> planet) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "History of ${planet['title']}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            FadeInUpBig(
              child: Text(
                planet['history'],
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            Image.asset(
              planet['historyImg'],
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              "Lunar Exploration",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            FadeInUpBig(
              child: Text(
                planet['historyDetail2'],
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiagramTab(Map<String, dynamic> planet) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${planet['title']} Diagram",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            FadeInUpBig(
              child: Text(
                planet['diagram'],
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            Image.asset(
              planet['diagramImg'],
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              "Key Facts",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            FadeInUpBig(
              child: Text(
                planet['diagramDetail2'],
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
