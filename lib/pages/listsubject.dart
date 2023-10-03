import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:testapp2/pages/addsubject.dart';

class ListSubject extends StatefulWidget {
  const ListSubject({super.key});

  @override
  State<ListSubject> createState() => _ListSubjectState();
}

class _ListSubjectState extends State<ListSubject> {

  List records = []; // Define a list to store records

  Future<void> listSubject() async {
    final pb = PocketBase('http://10.0.2.2:8090');

    final data = await pb.collection("COURSES").getFullList();
    setState(() {
      records = data;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    listSubject();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:  Container(
        child: ListView.builder(
          itemCount: records.length,
          itemBuilder: (context, int i) {
            final record = records[i];
            return Container(
              margin: EdgeInsets.all(7),
              child: ListTile(
                title: Text(record.getDataValue<String>("title")),
                subtitle: Text(record.getDataValue<String>("course_id")),
              ),
            );
          }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddSubject()));
      }, child: Icon(Icons.add),),
    );
  }
}