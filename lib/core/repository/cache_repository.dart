import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter_caching_api_data/core/model/api.model.dart';
import 'package:path_provider/path_provider.dart';

class CacheRepository {
  String fileName = 'CacheData.json';
  String API_URL = "https://reqres.in/api/users";

  Future getCacheDirectory() async {
    var cacheDir = await getTemporaryDirectory();
    if (await File(cacheDir.path + "/" + fileName).exists()) {
      // Load the data from cache
      print('Loading from cache');
      var jsonData = File(cacheDir.path + '/' + fileName).readAsStringSync();
      ApiResponse response = ApiResponse.fromJson(json.decode(jsonData));
      return response;
    } else {
      // Load the data from API call's response
      print('Loading from API');
      var response = await http.get(API_URL);

      if (response.statusCode == 200) {
        var jsonResponse = response.body;
        print(jsonResponse);
        ApiResponse res = ApiResponse.fromJson(json.decode(jsonResponse));
        var tempDir = await getTemporaryDirectory();
        File file = new File(tempDir.path + "/" + fileName);
        file.writeAsString(jsonResponse,flush: true, mode: FileMode.write);
        return res;
      }
      

    }
  }
}
