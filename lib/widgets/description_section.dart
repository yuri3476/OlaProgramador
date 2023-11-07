import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Text("Você já se perguntou como funciona o mundo digital que nos cerca? Este curso introdutório é projetado para ajudá-lo a compreender os conceitos fundamentais e as habilidades essenciais necessárias para navegar no universo digital de forma eficaz. Seja você um novato completo ou alguém que deseja aprimorar suas habilidades digitais, este curso oferece uma base sólida para seu aprendizado.",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black.withOpacity(0.7),
          ),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Text(
              "Duração do curso",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w600,
              ),
            ),
                        
            Icon(
              Icons.timer,
              color: Color(0xFF674AEF),
            ),
            SizedBox(width: 5),
            Text(
              "26 Horas",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
         Row(
          children: [
            Text(
              "Avaliação:",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 5),  
            Icon(
              Icons.star,
              color: Colors.amber,
            ),
            SizedBox(width: 5),
            Text(
              "40 Horas",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
 
      ],
      ),
    );
  }
}
