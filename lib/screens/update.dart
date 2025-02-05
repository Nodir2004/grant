import 'package:flutter/material.dart';
import 'package:grant/service/firebase_service.dart';

class UpdateWidget extends StatefulWidget {
  final String docId;
  final Map<String, dynamic> initialData;

  const UpdateWidget({super.key, required this.docId, required this.initialData});

  @override
  State<UpdateWidget> createState() => _UpdateWidgetState();
}

class _UpdateWidgetState extends State<UpdateWidget> {
  late TextEditingController nameController;
  late TextEditingController categoryController;
  late TextEditingController deadlineController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.initialData['grand_name']);
    categoryController = TextEditingController(text: widget.initialData['category']);
    deadlineController = TextEditingController(text: widget.initialData['deadline']);
    descriptionController = TextEditingController(text: widget.initialData['description']);
  }

  @override
  Widget build(BuildContext context) {
    final firestoreService = FirebaseService();

    return Scaffold(
      appBar: AppBar(title: const Text('Grantni Yangilash')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Grant nomi'),
              ),
              TextField(
                controller: categoryController,
                decoration: const InputDecoration(labelText: 'Kategoriya'),
              ),
              TextField(
                controller: deadlineController,
                decoration: const InputDecoration(labelText: 'Deadline (YYYY-MM-DD)'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Tavsif'),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // firestoreService.updateGrant(widget.docId, {
                  //   'grand_name': nameController.text,
                  //   'category': categoryController.text,
                  //   'deadline': deadlineController.text,
                  //   'description': descriptionController.text,
                  // });
                  Navigator.pop(context);
                },
                child: const Text('Yangilash'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}