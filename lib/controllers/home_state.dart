import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trinity_wizard_project/models/contact_model.dart';

class HomeState extends GetxController {
  final RxList<ContactModel> _listContact = <ContactModel>[].obs;

  RxList<ContactModel> get listContact => _listContact;

  Future<void> readDummyJson() async {
    final String _response =
        await rootBundle.loadString('lib/assets/data.json');
    final List<dynamic> _data = await json.decode(_response);
    _listContact.value = List<ContactModel>.from(
        _data.map((model) => ContactModel.fromJson(model)));
  }
}
