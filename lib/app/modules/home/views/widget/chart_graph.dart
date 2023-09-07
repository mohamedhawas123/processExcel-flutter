import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SalaryChart extends StatelessWidget {
  final String selectedName;
  final double salary;
  final double percentage;

  SalaryChart({
    required this.selectedName,
    required this.salary,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    double calculatedValue = salary * (percentage / 100);

    return Container(
      padding: EdgeInsets.all(16.0),
      child: BarChart(
        BarChartData(
          axisTitleData: FlAxisTitleData(
              bottomTitle: AxisTitle(titleText: 'Percentage', showTitle: true),
              leftTitle: AxisTitle(titleText: 'Salary', showTitle: true)),
          maxY: salary * 1.2,
          barGroups: [
            BarChartGroupData(x: 0, barRods: [
              BarChartRodData(
                y: salary,
                width: 30,
                colors: [Colors.blue],
                borderRadius: BorderRadius.circular(8),
              ),
              BarChartRodData(
                y: calculatedValue,
                width: 20,
                colors: [Colors.green],
                borderRadius: BorderRadius.circular(8),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
