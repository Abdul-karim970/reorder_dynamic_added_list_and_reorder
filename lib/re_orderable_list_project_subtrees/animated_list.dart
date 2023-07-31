import 'package:flutter/material.dart';

import '../main.dart';

class DataAnimatedList extends StatefulWidget {
  const DataAnimatedList({
    super.key,
  });

  @override
  State<DataAnimatedList> createState() => _DataAnimatedListState();
}

class _DataAnimatedListState extends State<DataAnimatedList> {
  late double listPadding;

  // Screen size
  late double screenWidth;
  late double screenHeight;

  @override
  void didChangeDependencies() {
    Size screenSize = MediaQuery.sizeOf(context);
    screenWidth = screenSize.width;
    screenHeight = screenSize.height;

    listPadding = 20;

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.8,
      child: AnimatedList(
        key: listGlobalKey,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: EdgeInsets.all(listPadding),
        initialItemCount: dataList.length,
        itemBuilder: itemBuilder,
      ),
    );
  }

  Widget itemBuilder(
      BuildContext context, int index, Animation<double> animation) {
    return Item(
      index: index,
      animation: animation,
      dataList: dataList,
      itemData: dataList[index],
    );
  }
}

class Item extends StatelessWidget {
  const Item(
      {super.key,
      required this.itemData,
      required this.animation,
      required this.index,
      required this.dataList});
  final String itemData;
  final Animation<double> animation;
  final int index;
  final List<String> dataList;

  @override
  Widget build(BuildContext context) {
    // Screen size
    Size screenSize = MediaQuery.sizeOf(context);
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    // Data Item dataItem corner radius
    const itemCornerRadius = 15.0;
    final itemPadding = screenHeight * 0.02;

    return SlideTransition(
      position: animation
          .drive(CurveTween(curve: Curves.elasticOut))
          .drive(Tween(begin: const Offset(1, 0), end: Offset.zero)),
      child: Padding(
        padding: EdgeInsets.only(top: itemPadding),
        child: Container(
          padding: EdgeInsets.all(itemPadding),
          alignment: Alignment.centerLeft,
          height: screenHeight * 0.085,
          decoration: BoxDecoration(
              color: Colors.blueGrey.shade100,
              borderRadius: BorderRadius.circular(itemCornerRadius),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black38,
                    blurRadius: 5,
                    offset: Offset(-3, 3)),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                itemData,
                style: TextStyle(
                    color: Colors.blueGrey, fontSize: screenWidth * 0.05),
              ),
              InkWell(
                onTap: deleteItemOnPress,
                child: const Icon(
                  Icons.delete_outline_rounded,
                  color: Colors.blueGrey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Delete item on press
  void deleteItemOnPress() {
    if (dataList.isNotEmpty) {
      listGlobalKey.currentState!.removeItem(index, removeItemBuilder,
          duration: const Duration(milliseconds: 800));
      dataList.removeAt(index);
    }
  }

  Widget removeItemBuilder(BuildContext context, Animation<double> animation) {
    return Item(
      itemData: itemData,
      animation: animation,
      index: index,
      dataList: dataList,
    );
  }
}
