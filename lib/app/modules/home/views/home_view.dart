import 'package:excel/app/modules/home/views/chart_screen.dart';
import 'package:excel/app/modules/home/views/widget/chart_graph.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
          body: SafeArea(
              child: Container(
        color: Color(0Xff191919),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                controller.sendExcelFile();
              },
              child: Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  color: Color(0Xff172129),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.insert_drive_file,
                      size: 40,
                      color: Colors.white,
                    ),
                    SizedBox(height: 13),
                    Text(
                      'Upload Excel From Your Device',
                      style: TextStyle(
                        color: Color(0XFF3A4349),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              child: Container(
                height: 500,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.employes.length,
                    itemBuilder: (item, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () async {
                            controller.SelectedEmployee =
                                controller.employes[index];
                            Get.to(() => ChartScreen());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0XFF3A4349),
                                borderRadius: BorderRadius.circular(25)),
                            height: 50,
                            width: 350,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15, left: 9),
                              child: Text("${controller.employes[index].name}"),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      )));
    });
  }
}


// Container(
//                 padding: EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     Text(
//                       'saif\'s Salary and Calculated Value',
//                       style: TextStyle(
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 16.0),
//                     Text('Salary: \$${5000.toStringAsFixed(2)}'),
//                     Text('Percentage: ${10.toStringAsFixed(2)}%'),
//                     Text(
//                       'Calculated Value: \$${(5000 * (5000 / 10)).toStringAsFixed(2)}',
//                     ),
//                   ],
//                 )),