import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
}
