import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SwitchListPage(),
    );
  }
}

class SwitchListPage extends StatefulWidget {
  @override
  _SwitchListPageState createState() => _SwitchListPageState();
}

class _SwitchListPageState extends State<SwitchListPage> {
  // List of items with their switch state
  List<Item> items = [
    Item(name: "Item 1", isSwitched: false),
    Item(name: "Item 2", isSwitched: true),
    Item(name: "Item 3", isSwitched: false),
    Item(name: "Item 4", isSwitched: true),
    Item(name: "Item 5", isSwitched: false),
  ];

  // Method to update the state of the switch
  void updateSwitch(bool value, int index) {
    setState(() {
      items[index].isSwitched = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch ListTile Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return SwitchListTile(
              title: Text(items[index].name),
              value: items[index].isSwitched,
              onChanged: (bool value) {
                updateSwitch(value, index); // Update the toggle state dynamically
              },
            );
          },
        ),
      ),
    );
  }
}

// Item model to represent each item with a name and switch state
class Item {
  String name;
  bool isSwitched;

  Item({required this.name, required this.isSwitched});
}