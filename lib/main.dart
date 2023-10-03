import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:testapp2/pages/listsubject.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> Login() async {
    final email = emailController.text;
    final password = passwordController.text;

    final pb = PocketBase('http://10.0.2.2:8090');
    final authData = await pb.admins.authWithPassword(email, password);

    if(pb.authStore.isValid){
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  ListSubject()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: ListView(
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'email'
                ),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'password'
                ),
              ),
              ElevatedButton(onPressed: Login,  child: Text('เข้าสู่ระบบ'))
            ],
          )
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
