class Employee {
  final int id;
  final String name;
  final double salary;
  final double percentage;

  Employee({
    required this.id,
    required this.name,
    required this.salary,
    required this.percentage,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['name'],
      salary: double.parse(json['salary']),
      percentage: double.parse(json['percentage']),
    );
  }
}
