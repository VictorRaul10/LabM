import 'package:flutter/material.dart';
import 'package:laboratorio09/app/view/h1.dart';
import 'package:laboratorio09/app/view/shape.dart';
import 'package:laboratorio09/app/view/task_list_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Shape(),
            ],
          ),
          const SizedBox(height: 79),
          Image.asset(
            'assets/onboarding-image.png',
            width: 180,
            height: 168,
          ),
          const SizedBox(height: 99),
          const H1('Lista de tareas'),
          const SizedBox(height: 21),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return const TaskListPage();
                }));
              },
              child: const Text(
                'La mejor forma para que no se te olvide nada es anotarlo. '
                'Guardar tus tareas y ve completando poco a poco para aumentar tu productividad',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



