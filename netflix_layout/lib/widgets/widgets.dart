import 'package:flutter/material.dart';

class DropDownButton extends StatelessWidget {
  final String text;
  final bool isHighlighted;
  const DropDownButton({super.key, required this.text, required this.isHighlighted});


  @override
  Widget build(BuildContext context) {
    final Color color = isHighlighted ? Colors.white : Colors.grey;
    return Row(
      children: [
        Text(text, style: TextStyle(color: color, fontSize: 16),),
        SizedBox(width: 5,),
        Icon(Icons.arrow_drop_down, color: color,),
      ],
    );
  }
}

class IconWithTitleCTA extends StatelessWidget {
  final String name;
  final IconData icon;
  const IconWithTitleCTA({super.key, required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 30,),
        Text(name, style: TextStyle(fontSize: 12),)
      ],
    );
  }
}

class MovieSection extends StatelessWidget {
  final String title;
  final List<String> imagePaths;

  const MovieSection({
    super.key,
    required this.title,
    required this.imagePaths,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        // Horizontal Movie List
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: imagePaths
                .map((path) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Image.asset(
                        path,
                        height: 250,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class FeaturedMovieSection extends StatelessWidget {
  final String title;
  final List<String> imagePaths;

  const FeaturedMovieSection({
    super.key,
    required this.title,
    required this.imagePaths,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        // Horizontal Movie List (larger thumbnails)
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: imagePaths
                .map(
                  (path) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        path,
                        height: 350,
                        width: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
