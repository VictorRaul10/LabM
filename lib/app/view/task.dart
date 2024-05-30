// task.dart

class Task {
  Task(this.title, {this.done = false});

  final String title;
  bool done; // Quitamos el modificador final para permitir la modificación
}

