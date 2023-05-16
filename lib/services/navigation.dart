import 'package:get/get.dart';
import 'package:trinity_wizard_project/screens/contact_form_screen.dart';

class Navigation {
  toContactForm() {
    Get.to(
      () => const ContactFormScreen(),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 300),
    );
  }
}
