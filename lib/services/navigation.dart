import 'package:get/get.dart';
import 'package:trinity_wizard_project/models/contact_model.dart';
import 'package:trinity_wizard_project/screens/contact_form_screen.dart';

class Navigation {
  toContactForm(ContactModel contactData) {
    Get.to(
      () => ContactFormScreen(
        data: contactData,
      ),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 300),
    );
  }
}
