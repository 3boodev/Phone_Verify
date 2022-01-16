import 'package:flutter/material.dart';
import 'package:phonevalidite/pages/home_page.dart';
import 'package:phonevalidite/provider/phonedata_provider.dart';
import 'package:provider/provider.dart';

void main()async {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider<PhoneData>(create: (_) => PhoneData())],
    child: await MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Phone Validate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const HomePage(),
    );
  }
}
