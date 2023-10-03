import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:testapp2/pages/listsubject.dart';

class AddSubject extends StatefulWidget {
  const AddSubject({super.key});

  @override
  State<AddSubject> createState() => _AddSubjectState();
}

class _AddSubjectState extends State<AddSubject> {
  TextEditingController idController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController lecturerController = TextEditingController();

  Future<void> addsubject() async {
    final pb = PocketBase('http://10.0.2.2:8090');

    final body = <String, dynamic>{
      "course_id": idController.text,
      "title": titleController.text,
      "lecturer": lecturerController.text
    };
    final record = pb.collection("COURSES").create(body:body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: ListView(
            children: [
              TextField(
                controller: idController,
                decoration: InputDecoration(
                  labelText: "Id"
                ),
              ),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: "title"
                ),
              ),
              TextField(
                controller: lecturerController,
                decoration: InputDecoration(labelText: "lecturer"),
              ),
              ElevatedButton(onPressed: addsubject, child: Text("add"))
            ],
          ),
        ),
      ),
    );
  }
}