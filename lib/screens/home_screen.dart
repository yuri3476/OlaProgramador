import 'package:flutter/material.dart';
import 'package:meu_primeiro_app/screens/course_screen.dart';
import 'package:meu_primeiro_app/screens/bookstore_screen.dart';
import 'package:meu_primeiro_app/screens/live_course_screen.dart';
import 'package:meu_primeiro_app/screens/challenges_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categoryNames = ['Livraria', 'Curso ao vivo', 'Desafios'];
  List<Color> categoryColors = [
    Color(0xFFFFCF2F),
    Color(0xFF6FE08D),
    Color(0xFF61BDFD),
  ];

  List<Icon> categoryIcons = [
    Icon(Icons.store, color: Colors.white, size: 30),
    Icon(Icons.video_library, color: Colors.white, size: 30),
    Icon(Icons.assignment, color: Colors.white, size: 30),
  ];

  List<String> imageList = ['Flutter', 'React Native', 'Python', 'C#'];
  List<String> filteredImageList = ['Flutter', 'React Native', 'Python', 'C#'];

  List<String> courseList = [
    'Machine Learning Basics',
    'Web Development Fundamentals',
    'Mobile App Development with Flutter',
    'Data Science and Python',
    'UI/UX Design Principles',
    'Game Development with Unity'
  ];

  TextEditingController searchController = TextEditingController();

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      filterCourses(searchController.text);
    });
  }

  void filterCourses(String query) {
    query = query.toLowerCase();

    setState(() {
      if (query.isEmpty) {
        filteredImageList = List.from(imageList);
      } else {
        filteredImageList = imageList
            .where((course) => course.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        iconSize: 32,
        selectedItemColor: Color(0xFF674AEF),
        selectedFontSize: 18,
        unselectedFontSize: 18,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onNavItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Cursos',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Conta'),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomeScreen();
      case 1:
        return _buildCoursesScreen();
      case 2:
        return _buildChatScreen();
      case 3:
        return _buildAccountScreen();
      default:
        return _buildHomeScreen();
    }
  }

  Widget _buildHomeScreen() {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
          decoration: BoxDecoration(
            color: Color(0xFF674AEF),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.dashboard,
                    size: 30,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.notifications,
                    size: 30,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 3, bottom: 15),
                child: Text(
                  'Olá, Programador',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    wordSpacing: 2,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 20),
                width: MediaQuery.of(context).size.width,
                height: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: searchController,
                  onChanged: filterCourses,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Procure aqui...",
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Column(
            children: [
              GridView.builder(
                itemCount: categoryNames.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookstoreScreen(),
                          ),
                        );
                      } else if (index == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LiveCourseScreen(),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChallengesScreen(),
                          ),
                        );
                      }
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: categoryColors[index],
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: categoryIcons[index],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          categoryNames[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cursos mais assistidos",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              GridView.builder(
                itemCount: filteredImageList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio:
                      (MediaQuery.of(context).size.height - 50 - 25) /
                          (4 * 240),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CourseScreen(filteredImageList[index]),
                        ),
                      );
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFF5F3FF),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Image.asset(
                              "images/${filteredImageList[index]}.png",
                              width: 90,
                              height: 90,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            filteredImageList[index],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "55 Videos",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCoursesScreen() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cursos",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xFF674AEF),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                _buildCourseItem(
                  'Introdução à Programação: da Teoria à Prática',
                  'Aprenda os conceitos básicos da programação',
                  'images/logica.png',
                ),
                _buildCourseItem(
                  'Desenvolvimento Front End',
                  'Fundamentos utilizando HTML, CSS e JS',
                  'images/front.png',
                ),
                _buildCourseItem(
                  'Desenvolvimento de jogos',
                  'Construa jogos simples e divertidos',
                  'images/games.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseItem(String title, String description, String imagePath) {
    return InkWell(
      onTap: () {
        // Navegue para a tela de detalhes do curso ou faça outra ação desejada
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 15),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF674AEF),
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatScreen() {
    // Substitua este Container por widgets que representam a interface do chat
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Chat Global',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xFF674AEF),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                // Aqui você pode adicionar widgets para exibir mensagens de chat
                _buildChatMessage('Gabriel',
                    'Olá, Bom dia! Qual é a melhor linguagem \n de programação?'),
                _buildChatMessage('Instrutor',
                    'Olá Gabriel, Bom dia!, Se a linguagem tem \natualizações constantemente, a comunidade \nna internet é forte, existe grande mercado e o \nprogramador gosta, esta é a melhor!'),
                _buildChatMessage('Luana',
                    'Muitos desenvolvedores escolhem aprender \nvárias linguagens ao longo de suas carreiras \npara poderem se adaptar a diferentes situações.'),
                _buildChatMessage(
                    'Gabriel', 'Entendi, Muito obrigado pessoal.'),
                _buildChatMessage('Instrutor', '😁👍'),
              ],
            ),
          ),
          _buildChatInput(), // Este é um exemplo de um widget de entrada de chat
        ],
      ),
    );
  }

  Widget _buildChatMessage(String sender, String message) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            // Aqui você pode adicionar a lógica para exibir a imagem do remetente
            child: Text(sender[0]),
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sender,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(message),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChatInput() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextFormField(
                // Aqui você pode adicionar a lógica para a entrada de texto
                decoration: InputDecoration(
                  hintText: 'Digite sua mensagem...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // Adicione a lógica para enviar a mensagem
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAccountScreen() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Minha Conta",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xFF674AEF),
            ),
          ),
          SizedBox(height: 20),
          // Adicione informações da conta aqui, por exemplo:
          _buildAccountInfoItem("Nome", "Seu Nome"),
          _buildAccountInfoItem("E-mail", "seu.email@example.com"),
          _buildAccountInfoItem("Nível", "Programador Júnior"),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              _performLogout();
            },
            child: Text('Sair'),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountInfoItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF674AEF),
          ),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        Divider(height: 20, color: Colors.grey),
      ],
    );
  }

  void _performLogout() {
    // Adicione a lógica de logout aqui
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
