import 'package:flutter/material.dart';
import 'package:rest_api/http.dart';

import 'modalclass.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body: FutureBuilder(
        future: httpService().getUserData(),
        builder: (context,snapshot){
        if(snapshot.hasData)
          {
            List<Data> data = snapshot.data!;
             return ListView.builder(
                 itemCount: data.length,
                 itemBuilder: (context,index){
                   return ListTile(
                     leading: Text(data[index].id.toString()),
                     subtitle: Text(data[index].firstName.toString()),
                     title: Text(data[index].lastName.toString()),
                   );
                 }
             );
          }
          return  Center(child: CircularProgressIndicator());

        },
      ),
    );
  }
}
