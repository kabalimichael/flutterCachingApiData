import 'dart:convert';
import 'dart:io';

import 'package:flutter_caching_api_data/core/model/api.model.dart';
import 'package:path_provider/path_provider.dart';

class CacheRepository {
  String fileName = 'CacheData.json';

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
      

    }
  }
}
