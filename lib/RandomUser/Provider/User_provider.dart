import 'package:flutter/cupertino.dart';
import 'package:random_user_api/RandomUser/Api_helper/Api_helper.dart';
import 'package:random_user_api/RandomUser/Model/User_model.dart';

class UserProvider extends ChangeNotifier
{
  UserModel? data;

 Future<UserModel?> userDataModel()
   async {
       data = await Api_data.api_data.userDataParsing();
       notifyListeners();
  }
}