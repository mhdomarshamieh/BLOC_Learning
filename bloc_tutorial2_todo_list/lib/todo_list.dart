import 'package:bloc_tutorial2_todo_list/bloc/todo_bloc.dart';
import 'package:bloc_tutorial2_todo_list/cubit/todo_cubit.dart';
import 'package:bloc_tutorial2_todo_list/cubit/todo_cubit.dart';
import 'package:bloc_tutorial2_todo_list/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final todoBloc = BlocProvider.of<TodoBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: BlocBuilder<TodoBloc, List<Todo>>(
        builder: (context, todoList) {
          return ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(todoList[index].name),
                trailing: IconButton(
                  onPressed: () {
                    todoBloc.add(
                      TodoDeleted(
                        todoToDelete: todoList[index],
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.delete,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-todo');
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
