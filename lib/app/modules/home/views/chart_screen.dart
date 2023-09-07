import 'package:excel/app/modules/home/views/widget/chart_circle.dart';
import 'package:excel/app/modules/home/views/widget/chart_graph.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class ChartScreen extends GetView<HomeController> {
  const ChartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
          body: SafeArea(
              child: Container(
                  color: Color.fromARGB(255, 5, 43, 54),
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          child: SalaryChartCircle(
                            percentage: controller.SelectedEmployee!.percentage,
                            salary: controller.SelectedEmployee!.salary,
                            selectedName: controller.SelectedEmployee!.name,
                          ),
                        ),
                        Container(
                          height: 600,
                          child: SalaryChart(
                            percentage: controller.SelectedEmployee!.percentage,
                            salary: controller.SelectedEmployee!.salary,
                            selectedName: controller.SelectedEmployee!.name,
                          ),
                        ),
                      ],
                    ),
                  ))));
    });
  }
}
