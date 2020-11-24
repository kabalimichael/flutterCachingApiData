import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_caching_api_data/core/model/api.model.dart';
import 'package:flutter_caching_api_data/core/model/userdata.model.dart';
import 'package:flutter_caching_api_data/core/repository/cache_repository.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  CacheRepository  _cacheRepository = CacheRepository();
  Future<void> _deleteCacheContents() async {
    final cacheDir = await getTemporaryDirectory();
    String fileName = "CacheData.json";

    if (await File(cacheDir.path + "/" + fileName).exists()){
     cacheDir.delete(recursive: true) ;
     print('Deleted the CacheJson file!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Data Caching"),
      ),
      body:FutureBuilder(
        future: _cacheRepository.getCacheDirectory(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            List<UserData> userList = List<UserData>();
            print('Userlist length');
            print(userList.length);
            userList = snapshot.data.data;

            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index){
                UserData userData = userList[index];
                return ListTile(
                  title: Text(userData.firstName + " " + userData.lastName),
                  subtitle: Text(userData.email),
                );
              },
            );

          }else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: _deleteCacheContents,
        tooltip: 'Increment',
        child: Icon(Icons.delete),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
