import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../utils/my_colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Map<String, String>> tasks = []; // Lista przechowująca dane lokalnie

  void _addTask(String title, String description) {
    final now = DateTime.now();
    final date = DateFormat('yyyy-MM-dd HH:mm').format(now);
    setState(() {
      tasks.add({'title': title, 'description': description, 'date': date});
    });
  }

  void _updateTask(int index, String title, String description) {
    final now = DateTime.now();
    final date = DateFormat('yyyy-MM-dd HH:mm').format(now);

    setState(() {
      tasks[index] = {'title': title, 'description': description, 'date': date};
    });
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void _showTaskDialog({int? index}) {
    final titleController = TextEditingController(
        text: index != null ? tasks[index]['title'] : '');
    final descriptionController = TextEditingController(
        text: index != null ? tasks[index]['description'] : '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(index == null ? 'Add Task' : 'Edit Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text.trim();
                final description = descriptionController.text.trim();

                if (title.isEmpty || description.isEmpty) {
                  return;
                }

                if (index == null) {
                  _addTask(title, description);
                } else {
                  _updateTask(index, title, description);
                }

                Navigator.pop(context);
              },
              child: Text(index == null ? 'Add' : 'Update'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined, color: MyColors.whiteColor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Home',
            style: TextStyle(
              color: MyColors.whiteColor,
              fontWeight: FontWeight.w700,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          backgroundColor: MyColors.purpleColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align( alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    _showTaskDialog();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.pinkColor,
                  ),
                  child: Text(
                    'Add Task',
                    style: TextStyle(color: MyColors.whiteColor),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: tasks.asMap().entries.map((entry) {
                      final index = entry.key;
                      final task = entry.value;

                      return Card(
                        color: MyColors.pinkColor,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Text(
                            task['title'] ?? '',
                            style: TextStyle(
                              color: MyColors.whiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            '${task['description']}\nModified: ${task['date']}',
                            style: TextStyle(color: MyColors.whiteColor),
                          ),
                          isThreeLine: true,
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: MyColors.whiteColor,
                                ),
                                onPressed: () {
                                  _showTaskDialog(index: index);
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: MyColors.whiteColor,
                                ),
                                onPressed: () {
                                  _deleteTask(index);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}