
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:phonevalidite/provider/phonedata_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:phonevalidite/models/verify_model.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController num_controller=TextEditingController();

  @override
  void dispose() {
    num_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<PhoneData>(context);

    return ChangeNotifierProvider(create: (context)=>PhoneData(),
    child:
    Scaffold(
    appBar: AppBar(title: const Text("Phone Validate App"),centerTitle: true,),
    body: Center(
    child: Column(
    children: [
    Padding(
    padding: const EdgeInsets.only(top: 40,bottom: 20,left: 250,right: 250),
    child:Column(
    children: [
    TextField(
    controller: num_controller,
    keyboardType: TextInputType.number,
    onChanged: data.setnumber(num_controller.text),
    decoration: const InputDecoration(
    labelText:"Enter Your Number",
    prefixIcon: Icon(Icons.phone),
    border: OutlineInputBorder(),
    ),
    ),
    const SizedBox(height: 30,),
    ElevatedButton(onPressed: ()
    {
      data.setnumber(num_controller.text);
      data.fetchData(context);
    },
    child:const Text("Verify Number",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),)
    ],
    )
    ),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(data.verifyModel.valid==true?'The Phone is Valid':'The Phone is Not Valid',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
    Text('Mobile Number : ${data.verifyModel.number}'),
    Text('Local Format  : ${data.verifyModel.localFormat}'),
    Text('International Format : ${data.verifyModel.internationalFormat}'),
    Text('Country Prefix : ${data.verifyModel.countryPrefix}'),
    Text('Country Code : ${data.verifyModel.countryCode}'),
    Text('Country Name : ${data.verifyModel.countryName}'),
    Text('Location : ${data.verifyModel.location}'),
    Text('Carrier : ${data.verifyModel.carrier}'),
    Text('LineType : ${data.verifyModel.lineType}'),
    ],
    )
    ],
    ),
    ),
    )
    ,);
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
