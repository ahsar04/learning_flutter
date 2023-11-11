import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpPut extends StatefulWidget {
  const HttpPut({super.key});

  @override
  State<HttpPut> createState() => _HttpPutState();
}

class _HttpPutState extends State<HttpPut> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  String resultData = "Belum ada data";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HTTP POST',
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameController,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name",
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            controller: jobController,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Job",
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () async {
              var myResponse = await http.put(
                Uri.parse("https://reqres.in/api/users/2"),
                body: {"name": nameController.text, "job": jobController.text},
              );
              Map<String, dynamic> data =
                  json.decode(myResponse.body) as Map<String, dynamic>;
              setState(() {
                resultData = "${data['name']} - ${data['job']}";
              });
            },
            child: const Text("Submit"),
          ),
          const SizedBox(
            height: 50,
          ),
          const Divider(
            color: Colors.black,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(resultData)
        ],
      ),
    );
  }
}
