import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../data/sample_data.dart';
import '../widgets/movie_item.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen({super.key});

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  String searchQuery = '';
  Set<String> selectedGenres = {};
  String selectedSort = 'A-Z';

  final List<String> sortOptions = ['A-Z', 'Z-A', 'Year', 'Rating'];

  @override
  Widget build(BuildContext context) {
    // 7. Filter and Sort the Movie List
    List<Movie> visibleMovies = allMovies.where((movie) {
      // Filter by title
      bool matchesSearch = movie.title.toLowerCase().contains(searchQuery.toLowerCase());
      
      // Filter by genres
      bool matchesGenre = selectedGenres.isEmpty || 
          movie.genres.any((genre) => selectedGenres.contains(genre));
          
      return matchesSearch && matchesGenre;
    }).toList();

    // Sort visibleMovies
    switch (selectedSort) {
      case 'A-Z':
        visibleMovies.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Z-A':
        visibleMovies.sort((a, b) => b.title.compareTo(a.title));
        break;
      case 'Year':
        visibleMovies.sort((a, b) => b.year.compareTo(a.year));
        break;
      case 'Rating':
        visibleMovies.sort((a, b) => b.rating.compareTo(a.rating));
        break;
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 3. Title Heading
              const Text(
                'Find a Movie',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // 4. Responsive Search Bar
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search movies...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
              const SizedBox(height: 16),

              // 5. Genre Chips Using Wrap
              Row(
                children: [
                  const Text(
                    'Genres',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  if (selectedGenres.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Badge(
                        label: Text(selectedGenres.length.toString()),
                        backgroundColor: Colors.blue,
                      ),
                    ),
                  const Spacer(),
                  if (selectedGenres.isNotEmpty)
                    TextButton(
                      onPressed: () => setState(() => selectedGenres.clear()),
                      child: const Text('Clear'),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: allGenres.map((genre) {
                  bool isSelected = selectedGenres.contains(genre);
                  return FilterChip(
                    label: Text(genre),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedGenres.add(genre);
                        } else {
                          selectedGenres.remove(genre);
                        }
                      });
                    },
                    selectedColor: Colors.blue.withOpacity(0.2),
                    checkmarkColor: Colors.blue,
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),

              // 6. Sort Dropdown
              Row(
                children: [
                  const Text('Sort by:', style: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(width: 12),
                  DropdownButton<String>(
                    value: selectedSort,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedSort = newValue!;
                      });
                    },
                    items: sortOptions.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // 8. Responsive Movie List (ListView + LayoutBuilder)
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (visibleMovies.isEmpty) {
                      return const Center(child: Text('No movies found.'));
                    }

                    if (constraints.maxWidth < 800) {
                      // Phone: single-column vertical list
                      return ListView.builder(
                        itemCount: visibleMovies.length,
                        itemBuilder: (context, index) {
                          return MovieItem(movie: visibleMovies[index]);
                        },
                      );
                    } else {
                      // Tablet/Web: two-column movie layout
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2.5,
                        ),
                        itemCount: visibleMovies.length,
                        itemBuilder: (context, index) {
                          return MovieItem(movie: visibleMovies[index]);
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
