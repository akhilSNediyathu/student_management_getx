import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
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
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(100),
        child: Container(
        padding:const EdgeInsets.only(top: 25),
          color: Tcolo.primarycolor1,
          child: 
          // !controller.isSearching.isTrue?
         
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Student List ',style: titletxt,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    textAlign: TextAlign.start,
                  
                          style:  TextStyle(
                            
                            color: Tcolo.white
                          ),
                          onChanged: (query){
                            controller.filterStudents(query);
                          },
                          decoration: const InputDecoration(
                            
                            contentPadding: EdgeInsets.all(10),
                            prefixIcon: Icon(Icons.search),
                            hintText: 'search students',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            hintStyle: TextStyle(
                              
                color: Colors.white70,
                fontFamily: 'Comfortaa',
                 fontWeight: FontWeight.w300,
                 
                 
                            )
                          ),
                        ),
              ),
            ],
          ),
          // :
         
          // actions: [
          //   IconButton(onPressed: (){
              
          //     controller.toggleSearch();
          //   }, icon: const Icon(Icons.search))
          // ],
        ),
      ),
      body: Obx(() {
        return controller.filteredStudents.isEmpty?
         Center(
          child: SizedBox(
            width: 300,
            child: Lottie.asset('assets/no data found.json')),
          // child:
          //  Text('No Data Found.'
          
          // ,
          // style: TextStyle(
          //   fontWeight: FontWeight.w600,
          //   letterSpacing: 4,
          //   wordSpacing: 5
          // ),),
        )
        :Column(
          children: [
            
            Expanded(
              child: ListView.builder(
                itemCount: controller.filteredStudents.length,
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  final student = controller.filteredStudents[index];
                  return GestureDetector(
                    onTap: () {
              Get.to(StudentDetailspage(student: student))?.then((value) => controller.refreshStudentList());
                    },
                    child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: FileImage(File(student.profilePicture)),
                ),
                title: Text(
                  student.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
               subtitle:Text(student.schoolname),
               trailing: Text('age:${student.age.toString()}'),
              ),
                    ),
                  );
                },
              ),
            ),
          ],
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