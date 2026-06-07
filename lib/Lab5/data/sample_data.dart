import '../models/movie.dart';

final List<Movie> sampleMovies = [
  Movie(
    id: 1,
    title: 'Dune: Part Two',
    // Sử dụng ảnh từ Picsum (Dịch vụ ảnh demo không bị chặn CORS trên Web)
    posterUrl: 'https://picsum.photos/id/10/500/750', 
    overview: 'Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family.',
    genres: ['Sci-Fi', 'Adventure', 'Drama'],
    rating: 8.6,
    trailers: ['Official Trailer #1', 'IMAX Sneak Peek'],
  ),
  Movie(
    id: 2,
    title: 'Deadpool & Wolverine',
    posterUrl: 'https://picsum.photos/id/11/500/750',
    overview: 'The multiverse gets messy when Wade Wilson teams up with Wolverine for a not-so-family-friendly mission.',
    genres: ['Action', 'Comedy'],
    rating: 8.3,
    trailers: ['Red Band Trailer', 'Behind the Scenes'],
  ),
  Movie(
    id: 3,
    title: 'Oppenheimer',
    posterUrl: 'https://picsum.photos/id/12/500/750',
    overview: 'The story of J. Robert Oppenheimer\'s role in the development of the atomic bomb.',
    genres: ['Drama', 'History'],
    rating: 8.4,
    trailers: ['Official Trailer', 'Teaser'],
  ),
];
