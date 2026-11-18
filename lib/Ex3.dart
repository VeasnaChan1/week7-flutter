import 'package:flutter/material.dart';

List<String> images = [
  "assets/bird.jpg",
  "assets/bird2.jpg",
  "assets/insect.jpg",
  "assets/girl.jpg",
  "assets/man.jpg",
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
      home: StatefulScaffold(),
    ));

class StatefulScaffold extends StatefulWidget {
  const StatefulScaffold({
    super.key,
  });

  @override
  State<StatefulScaffold> createState() => _StatefulScaffoldState();
}

class _StatefulScaffoldState extends State<StatefulScaffold> {
  int index=0;

  void next(){
    setState(() {
      if(index==4){
        index= 0;
      }
      else{
        index++;
      }
    });
  }

  void before(){
    setState(() {
      if(index==0){
        index= 4;
      }else
      {
        index--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: before,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: next,
            ),
          ),
        ],
      ),
      body: Image.asset(images[index]),
    );
  }
}
