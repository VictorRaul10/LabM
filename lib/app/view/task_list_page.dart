import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:laboratorio09/app/view/h1.dart';
import 'package:laboratorio09/app/view/shape.dart';
import 'package:laboratorio09/app/view/task.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final TaskList = <Task>[
    Task('Tarea1'),
    Task('Tarea2'),
    Task('Tarea3'),
  ];

  Color _backgroundColor = Colors.white;

  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor = Colors.blue; // Cambia el color de fondo a azul
    });
  }

  void _showToast() {
    Fluttertoast.showToast(
      msg: '¡Hola desde Flutter!',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Center(child: Text('Atrás')),
        ),
      ),
      body: Container(
        color: _backgroundColor, // Aplica el color de fondo aquí
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                children: [
                  Row(children: [Shape()]),
                  Column(
                    children: [
                      Image.asset(
                        'assets/tasks-list-image.png',
                        width: 120,
                        height: 120,
                      ),
                      const SizedBox(height: 16),
                      const H1('Completa tus tareas', color: Colors.white),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 35),
              child: H1('Tareas'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ListView.separated(
                  itemCount: TaskList.length,
                  itemBuilder: (_, index) => _TaskItem(
                    TaskList[index],
                    onTap: () {
                      TaskList[index].done = !TaskList[index].done;
                      setState(() {});
                    },
                  ),
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _changeBackgroundColor,
            child: const Icon(Icons.color_lens),
            backgroundColor: Colors.green, // Cambia el color del botón
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: _showToast,
            child: const Icon(Icons.message),
            backgroundColor: Colors.orange, // Cambia el color del botón
          ),
        ],
      ),
    );
  }
}

class _TaskItem extends StatelessWidget {
  const _TaskItem(this.task, {Key? key, this.onTap}) : super(key: key);

  final Task task;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(21),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
          child: Row(
            children: [
              Icon(
                task.done
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 10),
              Text(task.title),
            ],
          ),
        ),
      ),
    );
  }
}




