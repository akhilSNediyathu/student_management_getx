import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management/controllers/home_page_controller.dart';
import 'package:student_management/core/colors.dart';
import 'package:student_management/core/constants.dart';
import 'package:student_management/view/add_student/add_students.dart';
import 'package:student_management/view/student_details/students_details_page.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Tcolo.primarycolor1,
        title: !controller.isSearching.isTrue?
        const Text('Student List ',style: titletxt,):
        TextField(
          style:  TextStyle(
            color: Tcolo.white
          ),
          onChanged: (query){
            controller.filterStudents(query);
          },
          decoration: const InputDecoration(
            hintText: 'search',
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.white70,
              fontFamily: 'Comfortaa',
               fontWeight: FontWeight.w300,
            )
          ),
        ),
        actions: [
          IconButton(onPressed: (){
            controller.toggleSearch();
          }, icon: const Icon(Icons.search))
        ],
      ),
      body: Obx(() {
        return controller.filteredStudents.isEmpty?
        const Center(
          child: Text('No Data Found.',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 4,
            wordSpacing: 5
          ),),
        ):GridView.builder(
          itemCount: controller.filteredStudents.length,
          padding:const EdgeInsets.all(8),
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8
          ),
           itemBuilder:
           (context ,index) {
            final student = controller.filteredStudents[index];
            return GestureDetector(
              onTap: () {
                Get.to(StudentDetailspage(student: student))?.then((value) => controller.refreshStudentList());
              },
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                            radius: 55.0,
                            backgroundImage:
                                FileImage(File(student.profilePicture)),
                          ),
                             const SizedBox(height: 8.0),
                             Text(
                            student.name,
                            style: const TextStyle(
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.bold),
                          ),

                  ],
                ),
              ),
            );
           }
           );
      }
      ),
            floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddStudentScreen())!
              .then((value) => controller.refreshStudentList());
        },
        backgroundColor: Tcolo.secondarycolor1,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}