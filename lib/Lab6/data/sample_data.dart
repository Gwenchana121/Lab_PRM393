import '../models/movie.dart';

final List<Movie> allMovies = [
  Movie(
    title: 'Dune: Part Two',
    year: 2024,
    genres: ['Sci-Fi', 'Adventure'],
    posterUrl: 'https://picsum.photos/id/10/200/300',
    rating: 8.6,
  ),
  Movie(
    title: 'Deadpool & Wolverine',
    year: 2024,
    genres: ['Action', 'Comedy'],
    posterUrl: 'https://picsum.photos/id/11/200/300',
    rating: 8.3,
  ),
  Movie(
    title: 'Oppenheimer',
    year: 2023,
    genres: ['Drama', 'History'],
    posterUrl: 'https://picsum.photos/id/12/200/300',
    rating: 8.4,
  ),
  Movie(
    title: 'The Dark Knight',
    year: 2008,
    genres: ['Action', 'Crime', 'Drama'],
    posterUrl: 'https://picsum.photos/id/13/200/300',
    rating: 9.0,
  ),
  Movie(
    title: 'Inception',
    year: 2010,
    genres: ['Action', 'Sci-Fi'],
    posterUrl: 'https://picsum.photos/id/14/200/300',
    rating: 8.8,
  ),
  Movie(
    title: 'Interstellar',
    year: 2014,
    genres: ['Sci-Fi', 'Drama'],
    posterUrl: 'https://picsum.photos/id/15/200/300',
    rating: 8.7,
  ),
];

final List<String> allGenres = [
  'Action',
  'Sci-Fi',
  'Adventure',
  'Comedy',
  'Drama',
  'History',
  'Crime'
];
