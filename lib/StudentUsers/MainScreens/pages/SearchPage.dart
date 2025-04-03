import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Center(
                  child: DropdownMenuItem(child: ListTile(
                    title: Text('Search Companies'),
                  )),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
