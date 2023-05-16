import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trinity_wizard_project/controllers/main_controller.dart';
import 'package:trinity_wizard_project/models/contact_model.dart';
import 'package:trinity_wizard_project/utils/utils.dart';
import 'package:trinity_wizard_project/widgets/avatar_widget.dart';
import 'package:trinity_wizard_project/widgets/date_picker_widget.dart';
import 'package:trinity_wizard_project/widgets/input_text_widget.dart';
import 'package:trinity_wizard_project/widgets/text_widget.dart';

class ContactFormScreen extends StatefulWidget {
  const ContactFormScreen({
    Key? key,
    this.data,
  }) : super(key: key);

  final ContactModel? data;

  @override
  State<ContactFormScreen> createState() => _ContactFormScreenState();
}

class _ContactFormScreenState extends State<ContactFormScreen> {
  final MainController _controller = Get.find();

  @override
  void initState() {
    _controller.loadContactData(widget.data!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leadingWidth: 75,
        leading: Center(
          child: InkWell(
            onTap: () => Get.back(),
            child: TextWidget(
              'Cancel',
              color: const Color(0xffff8c00),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Center(
              child: InkWell(
                onTap: () => _controller.updateDummyData(widget.data!),
                child: TextWidget(
                  'Save',
                  color: const Color(0xffff8c00),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: (() => FocusScope.of(context).unfocus()),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Center(child: AvatarWidget()),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        'Main Information',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputTextWidget(
                        radius: 10,
                        hintText: 'First Name',
                        textEditingController: _controller.firstName,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputTextWidget(
                        radius: 10,
                        hintText: 'Last Name',
                        textEditingController: _controller.lastName,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextWidget(
                        'Sub Information',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputTextWidget(
                        radius: 10,
                        hintText: 'Email',
                        textEditingController: _controller.email,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DatePickerWIdget(
                        hint: "-",
                        onTap: () async {
                          var data = await Utils.vShowDatePicker(context,
                              selectedDate: DateTime.now());
                          _controller.dob.text =
                              DateFormat("dd/MM/yyyy").format(data);
                        },
                        readOnly: true,
                        textEditingController: _controller.dob,
                        suffixIcon: const Icon(
                          Icons.calendar_today_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
