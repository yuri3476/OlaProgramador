import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';
import 'forget_password.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false; // Variável para controlar a visibilidade da senha

  void _registerUser(BuildContext context) async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      
      // Sucesso ao registrar o usuário, você pode adicionar ações aqui, se necessário.
      
      // Após o registro bem-sucedido, navegue de volta para a tela de login
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } catch (e) {
      print('Erro: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF674AEF), // Cor de fundo da tela
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white, // Cor do contêiner
              borderRadius: BorderRadius.circular(10.0), // Borda arredondada
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Cadastrar-se', // Título "Cadastrar-se" adicionado aqui
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF674AEF), // Cor do texto do título
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), // Borda arredondada
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), // Borda arredondada
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  obscureText: !_isPasswordVisible, // Mostrar/ocultar a senha com base na variável
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () => _registerUser(context),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF674AEF), // Cor de fundo do botão
                    onPrimary: Colors.white, // Cor de texto do botão
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 18), // Altura do botão
                  ),
                  child: Text(
                    'Registrar',
                    style: TextStyle(
                      fontSize: 20, // Tamanho do texto do botão
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    'Já tem uma conta? Entre aqui',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF674AEF), // Cor do texto do botão
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgetPasswordPage()),
                    );
                  },
                  child: Text(
                    'Esqueceu sua senha?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF674AEF), // Cor do texto do botão
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
