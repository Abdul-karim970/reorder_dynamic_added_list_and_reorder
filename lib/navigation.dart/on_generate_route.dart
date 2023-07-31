import 'package:flutter/cupertino.dart';
import 'package:reorderable_list_/pages/data_list_page.dart';
import 'package:reorderable_list_/pages/reorderable_list_page.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  if (settings.name == ListReOrderablePage.name) {
    return CupertinoPageRoute(
        builder: listReOrderablePageBuilder, settings: settings);
  } else if (settings.name == DataListPage.name) {
    return CupertinoPageRoute(builder: dataListPageBuilder, settings: settings);
  } else {
    return null;
  }
}

Widget listReOrderablePageBuilder(BuildContext context) {
  return const ListReOrderablePage();
}

Widget dataListPageBuilder(BuildContext context) {
  return const DataListPage();
}
