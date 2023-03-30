import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Dice Roller App',
    home: todoApp(),
  ));
}

class todoApp extends StatefulWidget {
  const todoApp({super.key});

  @override
  State<todoApp> createState() => _todoAppState();
}

class _todoAppState extends State<todoApp> {
  String val = '';
  var todoList = [
    '',
  ];

  addTODO(String item) {
    setState(() {
      todoList.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        backgroundColor: Colors.amber.shade400,
        centerTitle: true,
        title: Text(
          'My TODO List',
          style: TextStyle(
            color: Colors.blue.shade600,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return (index == 0)
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Add Item',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    onChanged: (value) {
                      setState(() {
                        val = value;

                        value = '';
                      });
                    },
                  ),
                )
              : ListTile(
                  title: Text(
                    '${todoList[index]}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  leading: Text(
                    '${index}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  trailing: Icon(Icons.remove),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.amber.shade600,
          onPressed: () {
            addTODO(val);
          }),
    );
  }
}
