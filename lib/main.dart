import 'package:flutter/material.dart';
import 'package:third_task/data.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: FutureBuilder(
        future: getPhoto(),
        builder: (context, snapshot) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: ((context, index) {
                if (snapshot.hasData && snapshot.data != null) {
                  final item = snapshot.data![index]; 
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              item.url,
                              fit:BoxFit.fill,
                              width: 140,
                              height: 130,
                            )
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 2, 30, 0),
                            child: Text(
                              item.title,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.white60
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              })
              
            );
            return Container();
          }
      ),
    );
  }
}
