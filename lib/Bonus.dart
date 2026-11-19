import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
    home: Scaffold(
      appBar: AppBar(
        title: Text("My score list"),
        backgroundColor: Colors.greenAccent,
      ),

      body: Column(
        children: [
          ScoreCard(subject: "Flutter",),
          ScoreCard(subject: "Flutter",),
          ScoreCard(subject: "Flutter",)
        ],
      ),
    ),
  ),
);

class ScoreCard extends StatefulWidget {
  final String subject;
  const ScoreCard({super.key, required this.subject});

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {


double progress=0.0;

    void addOne(){
    setState(
      (){
        if(progress==10.0){
          progress=0.0;
        }
        else{
          progress+=0.1;
        }
      }
    );
  }

  void removeOne(){
    setState(
      (){
        if(progress==0.0){
          progress==0.0;
        }
        else{
          progress-=0.1;
        }
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 188, 238, 190),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Text("My score in ${widget.subject}", style: TextStyle(fontSize: 30)),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed:addOne, icon: Icon(Icons.add)),
                    IconButton(onPressed: removeOne, icon: Icon(Icons.remove)),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey),

                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey,
                    minHeight: 20,
                    valueColor: AlwaysStoppedAnimation(Colors.green),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

