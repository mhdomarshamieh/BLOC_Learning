import 'package:bloc_tutorial2_todo_list/models/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent, List<Todo>> {
  TodoBloc() : super([]) {
    on<TodoAdded>(
      (event, emit) {
        final todo = Todo(
          name: event.newTodoTitle,
          createdAt: DateTime.now(),
        );

        emit([...state, todo]);
      },
    );

    on<TodoDeleted>(
      (event, emit) {
        emit(
          [
            for (final todo in state)
              if (todo != event.todoToDelete) todo
          ],
        );
      },
    );
  }
}
