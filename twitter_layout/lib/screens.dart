import 'package:flutter/material.dart';
import 'package:twitter_layout/post_card.dart';

//actual useful screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          //Top Navigation Bar
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom : BorderSide(
                  color: const Color.fromARGB(255, 204, 204, 204), width: .5, style: BorderStyle.solid,
                )
              )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipOval( child: Image.asset('assets/profile-pictures/main-profile.jpg', height: 30, fit: BoxFit.cover,),),
                  Image.asset('assets/icons/twitter.png', height: 20,),
                  Image.asset('assets/icons/magic.png', height: 25,),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                PostCard(
                  profilePicture: "assets/profile-pictures/profile (1).jpg",
                  name: 'Samantha',
                  handle: 'samanthawrites',
                  caption: "On this day in 2007, Steve Jobs introduced the first iPhone. A device that reshaped the world.",
                  time: "6h",
                  sharedPicture: 'assets/posts/steve-jobs.webp',
                  linkCaption: 'Watch the keynote again',
                  linkSite: 'apple.com',
                  isVerified: true,
                ),
                PostCard(
                  profilePicture: "assets/profile-pictures/profile (2).jpg",
                  name: 'Cynthia Zhang',
                  handle: 'cynthiacodes',
                  caption: "Every line of code you write is either a future bug or a future blessing. Choose wisely.",
                  time: "1h",
                ),
                PostCard(
                  profilePicture: "assets/profile-pictures/twitter.png",
                  name: 'Twitter Business',
                  handle: 'TwitterBusiness',
                  caption: "Did you know that people spend 26% more time veiwing ads on Twitter than on other leading platforms?\n\nGet in touch, and we'll  help you get started with advertising on Twitter.",
                  time: "1h",
                  sharedPicture: 'assets/posts/advertisement.jpg',
                  linkCaption: 'Share your details so we can reach out!',
                  linkSite: 'twitter.com',
                  isVerified: true,
                ),
                PostCard(
                  profilePicture: "assets/profile-pictures/profile (3).jpg",
                  name: 'Lena Ramirez',
                  handle: 'lena_travels',
                  caption: "Just got back from LA 🌴 The sunsets were surreal and the city vibe unmatched. Highly recommend for a summer getaway!",
                  time: "2h",
                  sharedPicture: 'assets/posts/LA.jpg',
                ),
                PostCard(
                  profilePicture: "assets/profile-pictures/profile (4).jpg",
                  name: 'Dev Tips',
                  handle: 'devdaily',
                  caption: "📌 Use Flutter’s `ListView.builder` for better performance with long lists.",
                  time: "30m",
                  isVerified: true,
                ),
                PostCard(
                  profilePicture: "assets/profile-pictures/profile (5).jpg",
                  name: 'Sana Ali',
                  handle: 'sana_life',
                  caption: "Some days are for deep work. Others are for slow coffee & journaling.",
                  time: "20m",
                ),
                PostCard(
                  profilePicture: "assets/profile-pictures/profile (6).jpg",
                  name: 'Tech Brief',
                  handle: 'techbriefdaily',
                  caption: "🚨 Google’s Gemini AI update is now rolling out to Pixel devices globally.",
                  time: "3h",
                  linkCaption: 'Explore what’s new in Gemini',
                  linkSite: 'google.blog',
                  isVerified: true,
                ),
                PostCard(
                  profilePicture: "assets/profile-pictures/profile (7).jpg",
                  name: 'Jamie O.',
                  handle: 'jamieooo',
                  caption: "Me trying to relax on weekends and Flutter tutorials be like 😂",
                  time: "1h",
                  sharedPicture: 'assets/posts/flutter.png', // replace with your actual image path
                  linkCaption: 'Master Flutter step by step',
                  linkSite: 'flutter.dev',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//3 screens below are just placeholders
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Search Screen Place-holder'),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Notifications Screen Place-holder'),
    );
  }
}

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Messages Screen Place-holder'),
    );
  }
}