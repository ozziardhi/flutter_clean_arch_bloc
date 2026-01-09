class GeneralException implements Exception {
  final String message;

  const GeneralException([this.message = 'An unexpected error occurred']);
}

class ServerException implements Exception {
  final String message;

  const ServerException([this.message = 'An unexpected error occurred']);
}

class StatuscodeException implements Exception {
  final String message;

  const StatuscodeException([this.message = 'An unexpected error occurred']);
}

class EmptyException implements Exception {
  final String message;

  const EmptyException([this.message = 'An unexpected error occurred']);
}
