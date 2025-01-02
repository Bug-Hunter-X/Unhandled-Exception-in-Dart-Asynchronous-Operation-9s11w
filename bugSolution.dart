```dart
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // ignore: avoid_print
      print('Success: ${response.body}');
    } else {
      // ignore: avoid_print
      print('Request failed with status: ${response.statusCode}.');
      //Instead of throwing a generic exception, throw a more specific one
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  } on Exception catch (e) {
    // Handle specific exception types separately if needed.
    // ignore: avoid_print
    print('Exception caught: $e');
    //Log the exception to a service like Sentry
  } catch (e) {
    // Handle any other unexpected errors
    // ignore: avoid_print
    print('Unexpected error: $e');
    //Log the exception to a service like Sentry
  }
}

void main() async {
  await fetchData();
}
```