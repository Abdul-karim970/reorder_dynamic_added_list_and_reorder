import 'package:flutter/material.dart';
import 'package:reorderable_list_/main.dart';

class ListReOrderablePage extends StatefulWidget {
  const ListReOrderablePage({super.key});
  static const name = 'ListReOrderablePage/';

  @override
  State<ListReOrderablePage> createState() => _ListReOrderablePageState();
}

class _ListReOrderablePageState extends State<ListReOrderablePage> {
  late List<_ReOrderableListItem> reOrderableList;

  @override
  Widget build(BuildContext context) {
    reOrderableList = [
      for (int i = 0, tileNumber = 1; i < dataList.length; i++, tileNumber++)
        _ReOrderableListItem(
          key: ValueKey(i),
          index: i,
          tileNumber: tileNumber,
          title: dataList[i],
        )
    ];
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.blueGrey.shade100,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                icon: Icon(
                  Icons.done_outline_rounded,
                  color: Colors.blueGrey.shade100,
                ))
          ],
          title: Text(
            'Reorder',
            style: TextStyle(color: Colors.blueGrey.shade100),
          )),
      body: Center(
        child: ReorderableListView(
            key: UniqueKey(), onReorder: onReOrder, children: reOrderableList),
      ),
    );
  }

  void onReOrder(int oldIndex, int newIndex) {
    int finalNewIndex = 0;
    finalNewIndex = oldIndex < newIndex ? newIndex - 1 : newIndex;
    reOrderableList.insert(finalNewIndex, reOrderableList.removeAt(oldIndex));
    dataList.insert(finalNewIndex, dataList.removeAt(oldIndex));
  }
}

class _ReOrderableListItem extends StatelessWidget {
  const _ReOrderableListItem(
      {super.key,
      required this.index,
      required this.tileNumber,
      required this.title});
  final int index;
  final int tileNumber;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: Colors.blueGrey.shade100,
        title: Text(title),
        leading: CircleAvatar(
            backgroundColor: Colors.blueGrey,
            child: Text(
              tileNumber.toString(),
              style: TextStyle(color: Colors.blueGrey.shade100),
            )),
      ),
    );
  }
}
