import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:trinity_wizard_project/models/contact_model.dart';

class MainController extends GetxController {
  final RxList<ContactModel> _listContact = <ContactModel>[].obs;
  RxList<ContactModel> get listContact => _listContact;

  // text editing controller for contact form
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dob = TextEditingController();

  Future<void> readDummyJson() async {
    final String _response =
        await rootBundle.loadString('lib/assets/data.json');
    final List<dynamic> _data = await json.decode(_response);
    _listContact.value = List<ContactModel>.from(
        _data.map((model) => ContactModel.fromJson(model)));
  }

  void loadContactData(ContactModel data) {
    firstName.text = data.firstName ?? "";
    lastName.text = data.lastName ?? "";
    email.text = data.email ?? "";
    dob.text = data.dob ?? "";
  }

  Future<void> updateDummyData(ContactModel data) async {
    _listContact.every((element) {
      if (element.id == data.id) {
        element.firstName = firstName.text;
        element.lastName = lastName.text;
        element.email = email.text;
        element.dob = dob.text;
      }
      return true;
    });
    _listContact.refresh();
    Fluttertoast.showToast(msg: "Success Update");
  }
}
