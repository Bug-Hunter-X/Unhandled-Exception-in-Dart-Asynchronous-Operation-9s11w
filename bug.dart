```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // ignore: avoid_print
      print('Success: ${response.body}');
    } else {
      // ignore: avoid_print
      print('Request failed with status: ${response.statusCode}.');
      throw Exception('Failed to load data');
    }
  } catch (e) {
    // ignore: avoid_print
    print('Error: $e');
    rethrow; // Re-throw the exception to be handled higher up
  }
}

void main() async {
  try {
    await fetchData();
  } catch (e) {
    // Handle exception here, perhaps log it to a service like Sentry
    // ignore: avoid_print
    print('An error occurred: $e');
  }
}
```