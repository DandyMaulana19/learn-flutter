// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:try_flutter/model/user.dart';

class LocalData extends StatefulWidget {
  const LocalData({super.key});

  @override
  State<LocalData> createState() => _LocalDataState();
}

class _LocalDataState extends State<LocalData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                SaveSharedPreferences();
              },
              child: Text("Save to Shared Preferences")),
          ElevatedButton(
              onPressed: () {
                GetSharedPreferences();
              },
              child: Text("Get Shared Preferences")),
          Text(Savedname.isNotEmpty ? "Nama : $Savedname" : "Nama: Tidak Ada"),
          ElevatedButton(
              onPressed: () {
                SaveSecureStorage();
              },
              child: Text("Save to Secure Storage")),
          ElevatedButton(
              onPressed: () {
                getSecureStorage();
              },
              child: Text("Get Secure Storage")),
          Text(SavedToken.isNotEmpty
              ? "Token : $SavedToken"
              : "Token: Tidak Ada"),
          ElevatedButton(
              onPressed: () {
                SaveLocalData();
              },
              child: Text("SaveLocal")),
          ElevatedButton(
              onPressed: () {
                GetLocalData();
              },
              child: Text("GetLocal")),
          Text(LocalUser != null
              ? "User : ${LocalUser!.name} Token : ${LocalUser!.token}"
              : "User : Tidak Ada Token : Tidak Ada")
        ],
      ),
    ));
  }

  String name = "Dandy";
  String Savedname = "";
  void SaveSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('nama', name);
  }

  void GetSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      Savedname = prefs.getString("nama") ?? "Tidak Ada data";
    });
  }

  String Token = "asdacdqwe192e1";
  String SavedToken = "";
  void SaveSecureStorage() async {
    final storage = FlutterSecureStorage();
    await storage.write(key: 'UserToken', value: Token);
  }

  void getSecureStorage() async {
    final storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'UserToken');
    setState(() {
      SavedToken = value ?? "Tidak Ada data";
    });
  }

  Future<void> SaveLocalData() async {
    final filename = 'local_user';
    final file =
        File("${(await getApplicationDocumentsDirectory()).path}/$filename");
    User user = User(name: name, token: Token);
    await file.writeAsString(json.encode(user.toJson()));
  }

  User? LocalUser;
  Future<void> GetLocalData() async {
    final filename = 'local_user';
    final file =
        File("${(await getApplicationDocumentsDirectory()).path}/$filename");
    String fileContent = await file.readAsString();
    setState(() {
      LocalUser = User.fromJson(json.decode(fileContent));
    });
  }
}
