import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart' as pie_chart;

class SalaryChartCircle extends StatelessWidget {
  final String selectedName;
  final double salary;
  final double percentage;

  SalaryChartCircle({
    required this.selectedName,
    required this.salary,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    double calculatedValue = salary + (salary * (percentage / 100));

    Map<String, double> dataMap = {
      'Salary': salary,
      'salary after Percentage': calculatedValue
    };

    return Container(
      padding: EdgeInsets.all(16.0),
      child: pie_chart.PieChart(
        dataMap: dataMap,
        chartType: pie_chart.ChartType.ring,
        chartRadius: 200,
        centerText:
            "${salary.toStringAsFixed(2)}\n(${(percentage).toStringAsFixed(2)}%)",
        legendOptions: pie_chart.LegendOptions(
          showLegendsInRow: true,
          legendPosition: pie_chart.LegendPosition.bottom,
        ),
        chartValuesOptions: pie_chart.ChartValuesOptions(
          showChartValueBackground: false,
          showChartValues: true,
          showChartValuesInPercentage: false,
          showChartValuesOutside: false,
        ),
      ),
    );
  }
}
