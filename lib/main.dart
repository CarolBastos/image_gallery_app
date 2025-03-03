import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo 2',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ImageGallery(),
    );
  }
}

class ImageGallery extends StatelessWidget {
  final List<String> images = [
    'assets/images/image1.png',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image4.jpg',
    'assets/images/image5.jpg',
    "assets/images/image6.jpg",
    "assets/images/image7.jpg",
    "assets/images/image8.jpg",
    "assets/images/image9.jpg",
    "assets/images/image10.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Gallery')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.blueAccent,
              child: Text(
                "Hello Flutter",
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
            ),
            Text("Hello Word"),
            TextField(decoration: InputDecoration(labelText: "Username")),
            Column(children: [Text("item 1"), Text("item 2"), Text("item 3")]),
            Row(children: [Text("item 1"), Text("item 2"), Text("item 3")]),
            ElevatedButton(
              onPressed: () {
                print("Tocou no botão");
              },
              child: Text("Incrementar"),
            ),
            Icon(Icons.star, color: Colors.blue, size: 30),
            Card(
              child: ListTile(
                title: Text("Card"),
                subtitle: Text("Subtitulo"),
                leading: Icon(Icons.info),
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
            DropdownButton<String>(
              items:
                  ['Option 1', 'Option 2', 'Option 3'].map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              onChanged: (value) {},
              value: 'Option 1',
            ),
            Switch(value: false, onChanged: (value) {}),
            Checkbox(value: true, onChanged: (value) {}),
            Row(
              children: [
                Expanded(
                  child: Container(color: Colors.red, width: 200, height: 50),
                ),
                Expanded(
                  child: Container(color: Colors.blue, width: 200, height: 50),
                ),
              ],
            ),
            SizedBox(
              width: 100,
              height: 20,
              child: Text(
                'HELLO WORLD COM SIZEDBOX',
                style: TextStyle(color: Colors.green),
              ),
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Número de colunas
              ),
              itemBuilder: (context, index) {
                return Card(child: Image.asset(images[index]));
              },
            ),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                ListTile(title: Text('item1')),
                ListTile(title: Text('item2')),
                ListTile(title: Text('item3')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// GridView.builder(
//         itemCount: images.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//         ),
//         itemBuilder: (context, index) {
//           return Card(child: Image.asset(images[index]));
//         },
//       )