import 'package:flutter/material.dart';
import 'package:remember_app/domain/api_clients/api_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Requests app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 17, 12, 12)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter'),
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
  int _counter = 0;
  String? userData;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 100,
            width: 100,
          ),
          const Text(
            "Нажмите, чтобы отправить запрос",
            style: TextStyle(
              color: Color.fromARGB(255, 46, 235, 52),
              fontWeight: FontWeight.bold,
              fontSize: 21,
              fontFamily: 'times new roman',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
              ),
              onPressed: () => ApiClient().getPosts(),
              child: const Text("Нажми на меня")),
          const SizedBox(
            height: 100,
            width: 100,
          ),
          SizedBox(
              width: 300,
              height: 300,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 16, 120, 231),
                        width: 3)),
                child: const Column(
                  children: [Text("Hello"), Text("It`s me"), Text("Some info")],
                ),
              ))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
