import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/location.dart';
import 'dart:io';

const apiKey = 'f948e8d9593a72e6eaa76d07efe61443';
late double latitude, longitude;

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    var url = Uri.parse(this.url);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      // se a requisição foi feita com sucesso
      var data = response.body;

      return jsonDecode(data);
    } else {
      // imprime mensagem na saída de erro
      stderr.writeln(response.statusCode);
    }
  }
}
