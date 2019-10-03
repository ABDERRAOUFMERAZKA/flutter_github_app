import 'package:flutter/material.dart';
import '../widgets/list_repos.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) => Column(
        children: <Widget>[
          Container(height: 90, child: SearchBar()),
          Container(
              height: constraints.maxHeight - 90,
              padding: EdgeInsets.only(top: 10),
              child: ListRepos())
        ],
      ),
    );
  }
}
