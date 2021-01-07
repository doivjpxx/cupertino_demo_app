import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'style.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const SearchBar({
    @required this.controller,
    @required this.focusNode,
  });
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Styles.searchBackground,
          borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
        child: Row(
          children: <Widget>[
            const Icon(
              CupertinoIcons.search,
              color: Styles.searchIconColor,
            ),
            Expanded(
                child: CupertinoTextField(
              controller: controller,
              focusNode: focusNode,
              style: Styles.searchText,
              cursorColor: Styles.searchCursorColor,
            )),
            GestureDetector(
              onTap: controller.clear,
              child: const Icon(
                CupertinoIcons.clear_thick_circled,
                color: Styles.searchIconColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
