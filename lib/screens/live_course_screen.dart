import 'package:flutter/material.dart';

class LiveCourseScreen extends StatelessWidget {
  final List<Map<String, String>> liveCourses = [
    {'courseName': 'Introdução a Python', 'instructor': 'Lucas Soares', 'time': '10:00 AM', 'date': '10/05/2024'},
    {'courseName': 'Lógica de Programação', 'instructor': 'Bruna Mendes', 'time': '02:00 PM', 'date': '11/05/2024'},
    {'courseName': 'O que é inteligência Artificial?', 'instructor': 'Luiz Gomes', 'time': '18:45 PM', 'date': '12/05/2024'},
    // Adicione mais cursos conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cursos ao Vivo'),
        backgroundColor: Color.fromARGB(255, 215, 197, 251),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 215, 197, 251), Color.fromARGB(255, 248, 247, 250)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Próximos Cursos ao Vivo 🎥',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: liveCourses.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(
                          liveCourses[index]['courseName'] ?? '',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Instrutor: ${liveCourses[index]['instructor'] ?? ''}'),
                            Text('Data: ${liveCourses[index]['date'] ?? ''}'),
                            Text('Horário: ${liveCourses[index]['time'] ?? ''}'),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseDetailsScreen(
                                courseName: liveCourses[index]['courseName'] ?? '',
                                instructor: liveCourses[index]['instructor'] ?? '',
                                date: liveCourses[index]['date'] ?? '',
                                time: liveCourses[index]['time'] ?? '',
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CourseDetailsScreen extends StatefulWidget {
  final String courseName;
  final String instructor;
  final String date;
  final String time;

  CourseDetailsScreen({required this.courseName, required this.instructor, required this.date, required this.time});

  @override
  _CourseDetailsScreenState createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  bool isConfirmed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Curso'),
        backgroundColor: Color.fromARGB(255, 215, 197, 251),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 215, 197, 251), Color.fromARGB(255, 248, 247, 250)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Text(
                'Curso: ${widget.courseName}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 20),
              Text('Instrutor: ${widget.instructor}'),
              Text('Data: ${widget.date}'),
              Text('Horário: ${widget.time}'),
              SizedBox(height: 20),
              Text(
                'O objetivo é criar um ambiente de aprendizado colaborativo e motivador, incentivando os participantes a se envolverem ativamente no processo e a desenvolverem habilidades práticas no tema escolhido.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isConfirmed = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: isConfirmed ? Colors.green : null,
                ),
                child: Text(isConfirmed ? 'Inscrição Confirmada' : 'Confirmar Inscrição'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LiveCourseScreen(),
  ));
}
