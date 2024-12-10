```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // ... use jsonData ...
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}, Body: ${response.body}');
    }
  } on SocketException catch (e) {
    print('Network error: $e'); //Handle network errors separately 
    // Consider retry logic, informing user
  } on FormatException catch (e) {
    print('JSON format error: $e'); //Handle JSON decoding errors separately
    // ... gracefully handle the missing data
  } catch (e) {
    print('An unexpected error occurred: $e');
    // Consider more sophisticated error reporting, alerts, or fallback mechanisms
    rethrow; // Rethrow to allow higher level handling if needed
  }
}
```