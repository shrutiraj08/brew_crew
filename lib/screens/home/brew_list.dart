import 'package:brew_crew/Provider/provider.dart';
import 'package:brew_crew/screens/home/brew_tile.dart';
import 'package:flutter/material.dart';

import 'package:brew_crew/models/brew.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BrewList extends ConsumerStatefulWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  ConsumerState<BrewList> createState() => _BrewListState();
}

class _BrewListState extends ConsumerState<BrewList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Brew>>(
        stream: ref.read(databaseProvider)!.brews,
        builder: (context, snapshot) {
          final brews = snapshot.data;
          if (snapshot.connectionState == ConnectionState.active &&
              snapshot.data != null) {
            if (snapshot.data!.isEmpty) {
              return Container();
            } else {
              return ListView.builder(
                itemCount: brews!.length,
                itemBuilder: (context, index) {
                  return BrewTile(brew: brews[index]);
                },
              );
            }
          } else {
            return Container();
          }
        });
  }
}
