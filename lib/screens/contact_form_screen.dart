import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trinity_wizard_project/controllers/main_controller.dart';
import 'package:trinity_wizard_project/models/contact_model.dart';
import 'package:trinity_wizard_project/widgets/avatar_widget.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget('aaa'),
        leading: InkWell(
          onTap: () => Get.back(),
          child: TextWidget('Cancel'),
        ),
        actions: [
          InkWell(
            onTap: (() => _controller.updateDummyData(widget.data!)),
            child: TextWidget('Save'),
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
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
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputTextWidget(
                    radius: 10,
                    hintText: 'Last Name',
                    textEditingController: _controller.lastName,
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
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputTextWidget(
                    radius: 10,
                    hintText: 'DOB',
                    textEditingController: _controller.dob,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
