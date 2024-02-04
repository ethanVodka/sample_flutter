import 'package:flutter/material.dart';
import 'http_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController getIdController = TextEditingController();
  String _userInfo = "";

  void sendJsonDataToBackend() async {
    int id = int.parse(getIdController.text);
    String response = await HttpService.getUser(id);

    setState(() {
      _userInfo = response;
    });
  }

  void sendDataToBackend() async {
    int id = int.parse(idController.text);
    String name = nameController.text;
    String address = addressController.text;

    await HttpService.insertUser(id, name, address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_userInfo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: getIdController,
              decoration: const InputDecoration(labelText: 'send id'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: sendJsonDataToBackend,
              child: const Text('Send JSON Data to Backend'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: idController,
              decoration: const InputDecoration(labelText: 'ID'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: sendDataToBackend,
              child: const Text('Send Form Data to Backend'),
            ),
          ],
        ),
      ),
    );
  }
}
