import 'package:flutter/cupertino.dart';
import 'package:phonevalidite/models/verify_model.dart';
import 'package:phonevalidite/pages/home_page.dart';

class PhoneData extends ChangeNotifier{
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