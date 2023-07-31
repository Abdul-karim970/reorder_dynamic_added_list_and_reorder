import 'package:flutter/material.dart';
import 'package:reorderable_list_/pages/reorderable_list_page.dart';
import 'package:reorderable_list_/re_orderable_list_project_subtrees/input_fields.dart';

import '../main.dart';
import '../re_orderable_list_project_subtrees/animated_list.dart';
import '../re_orderable_list_project_subtrees/whole_page_widgets.dart';

class DataListPage extends StatefulWidget {
  const DataListPage({
    super.key,
  });

  static const name = '/';

  @override
  State<DataListPage> createState() => _DataListPageState();
}

class _DataListPageState extends State<DataListPage> {
  // Screen size
  late double screenWidth;
  late double screenHeight;

// Data input field
  // Data input field controller
  late TextEditingController dataInputFieldController;

  @override
  void didChangeDependencies() {
    Size screenSize = MediaQuery.sizeOf(context);
    screenWidth = screenSize.width;
    screenHeight = screenSize.height;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    dataInputFieldController = TextEditingController();
  }

  @override
  void dispose() {
    dataInputFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        actions: [
          PopupMenuButton(
            color: Colors.blueGrey.shade100,
            itemBuilder: (context) => [
              PopupMenuItem(
                child: GestureDetector(
                  onTap: () async {
                    if (dataList.isNotEmpty) {
                      Navigator.of(context).pop();
                      await Navigator.of(context).pushNamed(
                        ListReOrderablePage.name,
                      );
                      listGlobalKey.currentState!.setState(() {});
                    } else {
                      Navigator.of(context).pop();
                      myBanner(
                          context: context,
                          content: 'List shouldn\'t be empty!');
                    }
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.align_horizontal_right_rounded,
                      ),
                      Text('Reorder list'),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
        title: Text(
          'Data List',
          style: TextStyle(color: Colors.blueGrey.shade100),
        ),
      ),
      body: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DataInputField(
                  controller: dataInputFieldController,
                  addItemOnPress: addItemOnPress,
                ),
                const DataAnimatedList()
              ],
            ),
          )),
    );
  }

  void addItemOnPress() {
    if (dataInputFieldController.text.isNotEmpty) {
      listGlobalKey.currentState!
          .insertItem(0, duration: const Duration(milliseconds: 1200));
      dataList.insert(0, dataInputFieldController.text);
      dataInputFieldController.clear();
    } else {
      myBanner(context: context, content: 'Field shouldn\'t empty!');
    }
  }
}
