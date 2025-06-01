import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/items.dart';
import 'package:flutter_application_1/providers/item_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 80),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Add items',
                border: OutlineInputBorder(),
              ),
              controller: _controller,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final provider = context.read<ItemProvider>();
                provider.addItem(Items(item: _controller.text));
                _controller.clear();
              },
              child: const Text('Add Items'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: context.watch<ItemProvider>().size,
                itemBuilder: (context, index) {
                  final provider = context.watch<ItemProvider>();
                  final item = provider.items[index];

                  return ListTile(
                    leading: Checkbox(
                      value: item.isCompleted,
                      onChanged: (value) {
                        final provider = context.read<ItemProvider>();
                        provider.toggleItem(item);
                      },
                    ),
                    title: Text(item.item),
                    trailing: IconButton(
                      onPressed: () {
                        final provider = context.read<ItemProvider>();
                        provider.deleteItem(item);
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
