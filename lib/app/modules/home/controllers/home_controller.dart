import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/employee/employee.dart';

class HomeController extends GetxController {
  final baseUrl = 'http://192.168.1.4:5000/api';
  List<Employee> employes = [];
  Employee? SelectedEmployee;

  Future<void> sendExcelFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);

      final Uri uri = Uri.parse('${baseUrl}/upload_excel');

      final request = http.MultipartRequest('POST', uri)
        ..files.add(await http.MultipartFile.fromPath('file', file.path));

      try {
        final response = await request.send();

        if (response.statusCode == 200) {
          Get.snackbar('success', 'your file successfully uploaded',
              backgroundColor: Colors.green);
          employes.clear();
          update();
          getEmployees();
        } else {
          Get.snackbar('error',
              'your excel file must have three column name, salary, percentage',
              backgroundColor: Colors.red);
        }
      } catch (e) {
        print('Error: $e');
      }
    } else {}
  }

  Future<void> getEmployees() async {
    try {
      var response = await http.get(Uri.parse('${baseUrl}/names'));
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        for (var i in responseData) {
          employes.add(Employee.fromJson(i));
        }
        update();
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    getEmployees();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
