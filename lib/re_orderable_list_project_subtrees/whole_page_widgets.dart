import 'package:flutter/material.dart';

void myBanner({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
      backgroundColor: Colors.blueGrey.shade100,
      dividerColor: Colors.transparent,
      content: Text(content),
      actions: [
        IconButton(
            onPressed: () =>
                ScaffoldMessenger.of(context).removeCurrentMaterialBanner(),
            icon: const Icon(
              Icons.close_rounded,
              color: Colors.blueGrey,
            ))
      ]));
}
