import 'package:cupertino_app/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'models/app_state_model.dart';
import 'product_row_item.dart';
import 'style.dart';

class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  TextEditingController _controller;
  FocusNode _focusNode;
  String _terms = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..addListener(_onTextChanged);
    _focusNode = FocusNode();
  }

  void _onTextChanged() {
    setState(() {
      _terms = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppStateModel>(context);
    final results = model.search(_terms);
    return DecoratedBox(
        decoration: const BoxDecoration(color: Styles.scaffoldBackground),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              _buildSearchBox(),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ProductRowItem(
                      index: index,
                      product: results[index],
                      lastItem: index == results.length - 1,
                    );
                  },
                  itemCount: results.length,
                ),
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode.dispose();
  }
}

extension MoreSearchTab on _SearchTabState {
  Widget _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchBar(controller: _controller, focusNode: _focusNode),
    );
  }
}
