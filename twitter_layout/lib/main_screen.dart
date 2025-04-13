import 'package:flutter/material.dart';
import 'package:twitter_layout/screens.dart';


//stateful because the screens can switch to placeholder screens through bottom navigation bar
class TwitterScreen extends StatefulWidget {
  const TwitterScreen({super.key});

  @override
  State<TwitterScreen> createState() => _TwitterScreenState();
}

class _TwitterScreenState extends State<TwitterScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    NotificationsScreen(),
    MessagesScreen(),
  ];

  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color.fromARGB(255, 221, 221, 221),
              width: 1,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => _onTap(0),
              child: Image.asset(
                _currentIndex == 0
                    ? 'assets/icons/home (2).png'
                    : 'assets/icons/home (1).png',
                height: 20,
              ),
            ),
            GestureDetector(
              onTap: () => _onTap(1),
              child: Image.asset(
                _currentIndex == 1
                    ? 'assets/icons/search (2).png'
                    : 'assets/icons/search (1).png',
                height: 20,
              ),
            ),
            GestureDetector(
              onTap: () => _onTap(2),
              child: Image.asset(
                _currentIndex == 2
                    ? 'assets/icons/ring (2).png'
                    : 'assets/icons/ring (1).png',
                height: 20,
              ),
            ),
            GestureDetector(
              onTap: () => _onTap(3),
              child: Image.asset(
                _currentIndex == 3
                    ? 'assets/icons/message (2).png'
                    : 'assets/icons/message (1).png',
                height: 20,
              ),
            ),
          ],
        ),
      ),

    );
  }
}