import 'package:flutter/material.dart';
import 'package:flutter_github_app/providers/list_favorite_repos_provider.dart';
import 'package:provider/provider.dart';
import '../providers/repos_provider.dart';

class ReposItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ReposProvider repos =
        Provider.of<ReposProvider>(context, listen: false);
    final ListFavoriteReposProvider listFavoriteReposProvider =
        Provider.of<ListFavoriteReposProvider>(context, listen: false);
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      elevation: 1,
      child: ListTile(
        title: Text(
          repos.name,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          repos.description != null ? repos.description : '',
        ),
        trailing: InkWell(
          onTap: () => listFavoriteReposProvider.toggleFavoriteRepos(repos),
          child: Consumer<ListFavoriteReposProvider>(
            builder: (ctx, listFavoriteReposProvider, _) => Icon(
              listFavoriteReposProvider.listFavoriteRepos
                          .indexWhere((e) => e.id == repos.id) >=
                      0
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
