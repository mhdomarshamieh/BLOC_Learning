part of 'todo_bloc.dart';

sealed class TodoEvent {}

final class TodoAdded extends TodoEvent {
  final String newTodoTitle;

  TodoAdded({required this.newTodoTitle});
}

final class TodoDeleted extends TodoEvent {
  final Todo todoToDelete;

  TodoDeleted({required this.todoToDelete});
}
