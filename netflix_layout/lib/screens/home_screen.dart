import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Use LayoutBuilder for responsiveness in the banner area.
    return Scaffold(
      // Top navigation bar.
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text(
          'Movies',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        actions: [
          const Icon(Icons.search),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/profile/profile.jpg',
                fit: BoxFit.cover,
                height: 30,
                width: 30,
              ),
            ),
          )
        ],
      ),
      
      // Body containing the main content.
      body: ListView(
        children: [
          /********************************************* Big movie banner ************************************************/
          LayoutBuilder(
            builder: (context, constraints) {
              final screenWidth = constraints.maxWidth;
              double bannerHeight = 600; // default for mobile increased to 400

              if (screenWidth >= 600 && screenWidth < 1200) {
                bannerHeight = 800; // medium screens increased to 600
              } else if (screenWidth >= 1200) {
                bannerHeight = 1000; // larger desktop screens increased to 800
              }

              return SizedBox(
                height: bannerHeight,
                child: Stack(
                  children: [
                    // Banner image covering entire area.
                    Positioned.fill(
                      child: Image.asset(
                        'assets/movies/originals/banner.jpg',
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                    // Gradient overlay covering the banner.
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: bannerHeight,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: const [
                              Colors.transparent,
                              Colors.black54,
                              Colors.black87,
                              Colors.black,
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Top overlay with drop-down buttons.
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          DropDownButton(
                            text: 'Movies',
                            isHighlighted: true,
                          ),
                          DropDownButton(
                            text: 'Stand-Up Comedy',
                            isHighlighted: false,
                          ),
                        ],
                      ),
                    ),
                    // Bottom overlay with tags and CTA buttons.
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          // Using Wrap instead of Row so that the genres wrap if needed.
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 4, // spacing between items horizontally
                            runSpacing: 4, // spacing between rows when wrapped
                            children: const [
                              Text(
                                'Raunchy',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                ' · ',
                                style: TextStyle(
                                  color: CupertinoColors.systemYellow,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                'Goofy',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                ' · ',
                                style: TextStyle(
                                  color: CupertinoColors.systemYellow,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                'Stand-Up',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                ' · ',
                                style: TextStyle(
                                  color: CupertinoColors.systemYellow,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                'Comedy',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                ' · ',
                                style: TextStyle(
                                  color: CupertinoColors.systemYellow,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                'Parenthood',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                ' · ',
                                style: TextStyle(
                                  color: CupertinoColors.systemYellow,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                'US',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const IconWithTitleCTA(
                                name: 'My List',
                                icon: Icons.add,
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.play_arrow,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        'Play',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              const IconWithTitleCTA(
                                name: 'Info',
                                icon: Icons.info_outline,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          /********************************************* movie card lists from here ************************************************/
          // Categories with horizontal scrolling.
          MovieSection(
            title: 'Action',
            imagePaths: [
              'assets/movies/action/ice-road.jpg',
              'assets/movies/action/interceptor.jpg',
              'assets/movies/action/international-assassin.webp',
              'assets/movies/action/misfire.jpg',
              'assets/movies/action/outside-the-wire.png',
              'assets/movies/action/uncharted.jpg',
              'assets/movies/action/ice-road.jpg',
              'assets/movies/action/interceptor.jpg',
              'assets/movies/action/international-assassin.webp',
              'assets/movies/action/misfire.jpg',
              'assets/movies/action/outside-the-wire.png',
              'assets/movies/action/uncharted.jpg',
              'assets/movies/action/ice-road.jpg',
              'assets/movies/action/interceptor.jpg',
              'assets/movies/action/international-assassin.webp',
              'assets/movies/action/misfire.jpg',
              'assets/movies/action/outside-the-wire.png',
              'assets/movies/action/uncharted.jpg',
            ],
          ),
          // Featured Netflix Originals Section.
          FeaturedMovieSection(
            title: 'Netflix Originals',
            imagePaths: [
              'assets/movies/originals/banner.jpg',
              'assets/movies/originals/barry.webp',
              'assets/movies/originals/clinical-2017.webp',
              'assets/movies/originals/first-they-killed-my-father-a-daughter-of-cambodia-remembers-2017.webp',
              'assets/movies/originals/money-heist.jpg',
              'assets/movies/originals/the-baby-sitters-club-netflix-146074.jpg',
              'assets/movies/originals/the-crown-show-poster.webp',
              'assets/movies/originals/the-fundamentals-of-caring-2016.webp',
              'assets/movies/originals/whatif.jpg',
              'assets/movies/originals/banner.jpg',
              'assets/movies/originals/barry.webp',
              'assets/movies/originals/clinical-2017.webp',
              'assets/movies/originals/first-they-killed-my-father-a-daughter-of-cambodia-remembers-2017.webp',
              'assets/movies/originals/money-heist.jpg',
              'assets/movies/originals/the-baby-sitters-club-netflix-146074.jpg',
              'assets/movies/originals/the-crown-show-poster.webp',
              'assets/movies/originals/the-fundamentals-of-caring-2016.webp',
              'assets/movies/originals/whatif.jpg',
            ],
          ),
          // Bollywood Movies Section.
          MovieSection(
            title: 'Bollywood',
            imagePaths: [
              'assets/movies/bollywood/aashiqui-2.webp',
              'assets/movies/bollywood/awarapan.jpg',
              'assets/movies/bollywood/jab-we-met.webp',
              'assets/movies/bollywood/kabir-singh.jpg',
              'assets/movies/bollywood/rockstar.jpg',
              'assets/movies/bollywood/veer-zaara.jpg',
              'assets/movies/bollywood/aashiqui-2.webp',
              'assets/movies/bollywood/awarapan.jpg',
              'assets/movies/bollywood/jab-we-met.webp',
              'assets/movies/bollywood/kabir-singh.jpg',
              'assets/movies/bollywood/rockstar.jpg',
              'assets/movies/bollywood/veer-zaara.jpg',
              'assets/movies/bollywood/aashiqui-2.webp',
              'assets/movies/bollywood/awarapan.jpg',
              'assets/movies/bollywood/jab-we-met.webp',
              'assets/movies/bollywood/kabir-singh.jpg',
              'assets/movies/bollywood/rockstar.jpg',
              'assets/movies/bollywood/veer-zaara.jpg',
            ],
          ),
          // Comedy Movies Section.
          MovieSection(
            title: 'Comedy',
            imagePaths: [
              'assets/movies/comedy/day-shift.jpg',
              'assets/movies/comedy/game-over-man.jpg',
              'assets/movies/comedy/isnt-it-romantic.webp',
              'assets/movies/comedy/Kinda-Pregnant-Poster.jpg',
              'assets/movies/comedy/the-starling.jpg',
              'assets/movies/comedy/To-All-The-Boys-Always-and-Forever-movie-poster.webp',
              'assets/movies/comedy/yours-mine-ours.jpg',
              'assets/movies/comedy/day-shift.jpg',
              'assets/movies/comedy/game-over-man.jpg',
              'assets/movies/comedy/isnt-it-romantic.webp',
              'assets/movies/comedy/Kinda-Pregnant-Poster.jpg',
              'assets/movies/comedy/the-starling.jpg',
              'assets/movies/comedy/To-All-The-Boys-Always-and-Forever-movie-poster.webp',
              'assets/movies/comedy/yours-mine-ours.jpg',
              'assets/movies/comedy/day-shift.jpg',
              'assets/movies/comedy/game-over-man.jpg',
              'assets/movies/comedy/isnt-it-romantic.webp',
              'assets/movies/comedy/Kinda-Pregnant-Poster.jpg',
              'assets/movies/comedy/the-starling.jpg',
              'assets/movies/comedy/To-All-The-Boys-Always-and-Forever-movie-poster.webp',
              'assets/movies/comedy/yours-mine-ours.jpg',
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined),
            label: 'Coming Soon',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_for_offline_outlined),
            label: 'Downloads',
          ),
        ],
      ),
    );
  }
}
