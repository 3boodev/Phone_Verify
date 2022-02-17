import 'package:flutter/cupertino.dart';
import 'package:phonevalidite/models/verify_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class PhoneData with ChangeNotifier{
  late VerifyModel verifyModel=VerifyModel();
  String numberv="1096782197";
  String get number => numberv;
  setnumber(String number) {
    numberv = number;
    notifyListeners();
  }
  fetchData(context) async{

    verifyModel = await getData(context,number);

    notifyListeners();
  }
}
Future<VerifyModel> getData(context,String phone_number) async {
  late VerifyModel verifyModel;

  try {
    final response = await http
        .get(Uri.parse('http://apilayer.net/api/validate?access_key=d8093fc2508ce8045698ea8e0ba85ed2&number=$phone_number&country_code=EG&format='));
    //http://apilayer.net/api/validate?access_key=d8093fc2508ce8045698ea8e0ba85ed2&number=$phone_number&country_code=$country_code&format='

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      verifyModel = VerifyModel.fromJson(data);
    }else{
      print("Something went wrong");
    }
  } catch (e) {
    print(e.toString());
  }

  return verifyModel;
}