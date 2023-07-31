import 'package:flutter/material.dart';

class DataInputField extends StatefulWidget {
  const DataInputField(
      {super.key, required this.controller, required this.addItemOnPress});
  final TextEditingController controller;
  final GestureTapCallback addItemOnPress;

  @override
  State<DataInputField> createState() => _DataInputFieldState();
}

class _DataInputFieldState extends State<DataInputField> {
  late double screenWidth;
  late double screenHeight;
  late TextEditingController controller;
  late GestureTapCallback addItemOnPress;

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
    controller = widget.controller;
    addItemOnPress = widget.addItemOnPress;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      controller: controller,
      keyboardAppearance: Brightness.light,
      keyboardType: TextInputType.name,
      cursorRadius: const Radius.circular(20),
      cursorColor: Colors.blueGrey,
      decoration: InputDecoration(
          suffixIcon: InkWell(
            onTap: addItemOnPress,
            child: const Icon(
              Icons.send_rounded,
              color: Colors.blueGrey,
            ),
          ),
          hintText: 'Enter data',
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.blueGrey,
          )),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            width: 2,
            color: Colors.blueGrey,
          ))),
    );
  }
}
