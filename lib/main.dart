

import 'package:flutter/material.dart';
import 'package:flutter_basic/mahasiswa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Assalamualaikum'),
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
  bool isLoading = true;
  List<Mahasiswa> listMahasiswa = [
    Mahasiswa(nim: 669, nama: 'RyooAje', addres: 'Tohupo'),
    Mahasiswa(nim: 665, nama: 'MalikPaulo', addres: 'Luwuk'),
    Mahasiswa(nim: 663, nama: 'RyooAdam', addres: 'Kabila'),
    Mahasiswa(nim: 661, nama: 'RyooSantai', addres: 'Kota'),
    Mahasiswa(nim: 667, nama: 'Ekaremix', addres: 'Panggulo'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Text('Data Mahasiswa'),
                    content: Column(children: [
                      Row(
                        mainAxisAlignment: 
                        MainAxisAlignment.spaceAround,
                        children: [
                        const Text('Name:'),
                      Text(listMahasiswa[index].nama) 
                      ],
                      ),
                    ]),
                  );
                });
            },



            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.pink,
                child: Text('${listMahasiswa[index].nim}'),
              ),
              title: Text('${listMahasiswa[index].nama}'),
              subtitle: Text('${listMahasiswa[index].addres}'),
            ),
          );
        },
        itemCount: listMahasiswa.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
