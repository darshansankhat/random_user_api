import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:random_user_api/RandomUser/Model/User_model.dart';

class Api_data {

  static Api_data api_data = Api_data();

  Future<UserModel> userDataParsing() async {

    String link="https://randomuser.me/api/";

    var response = await http.get(Uri.parse(link));

    var json=jsonDecode(response.body);

    UserModel userModel = UserModel.fromJson(json);

    return userModel;
  }
}
