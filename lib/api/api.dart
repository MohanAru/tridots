import 'package:tridotsapk/model.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<NewsLog> fetchNewsLog(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return newsLogFromJson(response.body);
    } else {
      throw Exception('Failed to load news log');
    }
  }
}
