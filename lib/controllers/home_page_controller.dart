

import 'package:get/get.dart';
import 'package:student_management/data_base_helper/data_base_helper.dart';
import 'package:student_management/model/student_model.dart';

class HomeController extends GetxController{
  RxBool isSearching = false.obs;
  RxList<Student> students = <Student>[].obs;
  RxList<Student> filteredStudents = <Student>[].obs;

  late DatabaseHelper databaseHelper;

  @override
  void onInit() {
    super.onInit();
    databaseHelper = DatabaseHelper();
    refreshStudentList();
  }

  Future<void> refreshStudentList() async {
    final studentList = await databaseHelper.getStudent();
    students.assignAll(studentList);
    filteredStudents.assignAll(studentList);
  }

  // ignore: unused_element
  void filterStudents(String query) {
    if (query.isEmpty) {
      filteredStudents.assignAll(students);
    } else {
      filteredStudents.assignAll(students
          .where((student) =>
              student.name.trim().toLowerCase().contains(query.trim().toLowerCase()))
          .toList());
    }
  }

   toggleSearch() {
    isSearching.toggle();
    if (!isSearching.isTrue) {
      filteredStudents.assignAll(students);
    }
  }
}