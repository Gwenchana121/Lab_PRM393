import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;
  const MovieDetailScreen({super.key, required this.movie});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.movie.title,
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Image with Title Overlay
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Hero(
                  tag: 'movie-poster-${widget.movie.id}',
                  child: Image.network(
                    widget.movie.posterUrl,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        height: 250,
                        color: Colors.grey[200],
                        child: const Center(child: CircularProgressIndicator()),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 250,
                      color: Colors.grey[300],
                      child: const Icon(Icons.broken_image, size: 50),
                    ),
                  ),
                ),
                // Gradient overlay for text readability
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.movie.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            // 2. Genres (Chips)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Wrap(
                spacing: 8.0,
                children: widget.movie.genres.map((genre) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      genre,
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                    ),
                  );
                }).toList(),
              ),
            ),

            // 3. Overview Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                widget.movie.overview,
                style: const TextStyle(fontSize: 15, color: Colors.black87, height: 1.4),
              ),
            ),

            // 4. Action Buttons (Favorite / Rate / Share)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(
                    icon: isFavorite ? Icons.favorite : Icons.favorite,
                    label: 'Favorite',
                    color: isFavorite ? Colors.red : Colors.grey.shade700,
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                  _buildActionButton(
                    icon: Icons.star, 
                    label: 'Rate', 
                    color: Colors.grey.shade700
                  ),
                  _buildActionButton(
                    icon: Icons.share, 
                    label: 'Share', 
                    color: Colors.grey.shade700
                  ),
                ],
              ),
            ),

            // 5. Trailers Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Trailers',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            
            // Using a Column for Trailers so they scroll with the rest of the page
            ...widget.movie.trailers.map((trailer) => Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.play_circle_filled, color: Colors.black87, size: 30),
                  title: Text(
                    trailer,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  onTap: () {},
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Divider(height: 1),
                ),
              ],
            )),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(color: color, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
