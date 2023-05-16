import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trinity_wizard_project/controllers/main_controller.dart';
import 'package:trinity_wizard_project/services/navigation.dart';
import 'package:trinity_wizard_project/widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MainController _controller = Get.put(MainController());
  @override
  void initState() {
    super.initState();
    _controller.readDummyJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
        centerTitle: true,
        leading: const Icon(Icons.search),
        actions: const [
          Icon(Icons.add),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Obx(
          () => GridView.builder(
            itemCount: _controller.listContact.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 18.0,
              mainAxisSpacing: 18.0,
            ),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () => Navigation().toContactForm(),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(7),
                    ),
                    border: Border.all(
                      color: const Color.fromRGBO(0, 0, 0, 0.25),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Color(0xffff8c00),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                        '${_controller.listContact[index].firstName!} ${_controller.listContact[index].lastName!}',
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.fade,
                        align: TextAlign.center,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
