import 'dart:convert';
import 'package:http/http.dart';

import 'modalclass.dart';

class httpService {
  Future<List<Data>> getUserData() async {
    Response response = await get(Uri.parse("https://reqres.in/api/users"));
    if (response.statusCode == 200) {
      UserData userdata = UserData.fromJson(json.decode(response.body));
      List<Data> resultList = [];
      resultList.addAll(userdata.data!);
      return resultList;
    } else {
      print(response.statusCode);
      throw "Unable to retrieve posts.";
    }
  }
}