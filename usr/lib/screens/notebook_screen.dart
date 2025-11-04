import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotebookScreen extends StatefulWidget {
  const NotebookScreen({super.key});

  @override
  State<NotebookScreen> createState() => _NotebookScreenState();
}

class _NotebookScreenState extends State<NotebookScreen> {
  final List<Map<String, String>> _notes = []; // Mock data
  final TextEditingController _noteController = TextEditingController();
  String _selectedCategory = 'دعاء';
  final List<String> _categories = ['دعاء', 'فكرة', 'هدف', 'شكر'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المذكرة الذكية'),
      ),
      body: Column(
        children: [
          _buildAddNoteSection(),
          Expanded(
            child: ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                final note = _notes[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(note['content']!),
                    subtitle: Text(note['category']!),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _deleteNote(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildAddNoteSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          DropdownButton<String>(
            value: _selectedCategory,
            items: _categories.map((category) {
              return DropdownMenuItem(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedCategory = value!;
              });
            },
          ),
          TextField(
            controller: _noteController,
            decoration: const InputDecoration(
              hintText: 'اكتب مذكرتك هنا...',
            ),
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  void _addNote() {
    if (_noteController.text.isNotEmpty) {
      setState(() {
        _notes.add({
          'content': _noteController.text,
          'category': _selectedCategory,
        });
        _noteController.clear();
      });
      // TODO: Save to Firebase Firestore and local storage
    }
  }

  void _deleteNote(int index) {
    setState(() {
      _notes.removeAt(index);
    });
    // TODO: Delete from Firebase
  }
}