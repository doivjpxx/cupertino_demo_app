import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'models/app_state_model.dart';
import 'style.dart';

const double _kDateTimePickerHeight = 216;

class ShoppingCartTab extends StatefulWidget {
  @override
  _ShoppingCartTabState createState() => _ShoppingCartTabState();
}

class _ShoppingCartTabState extends State<ShoppingCartTab> {
  String name;
  String email;
  String location;
  String pin;
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
        return CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Shopping Cart'),
            ),
            SliverSafeArea(
                top: false,
                minimum: const EdgeInsets.only(top: 4),
                sliver: SliverList(
                    delegate: _buildSliverChildBuilderDelegate(model))),
          ],
        );
      },
    );
  }
}

extension MoreShoppingCartTab on _ShoppingCartTabState {
  Widget _buildNameField() {
    return CupertinoTextField(
      prefix: const Icon(
        CupertinoIcons.person_solid,
        color: CupertinoColors.lightBackgroundGray,
        size: 28,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
      clearButtonMode: OverlayVisibilityMode.editing,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,
      decoration: const BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 0, color: CupertinoColors.inactiveGray))),
      placeholder: 'Name',
      onChanged: (newName) {
        setState(() {
          name = newName;
        });
      },
    );
  }

  Widget _buildEmailField() {
    return const CupertinoTextField(
      prefix: const Icon(
        CupertinoIcons.mail_solid,
        color: CupertinoColors.lightBackgroundGray,
        size: 28,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
      clearButtonMode: OverlayVisibilityMode.editing,
      autocorrect: false,
      decoration: const BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 0, color: CupertinoColors.inactiveGray))),
      placeholder: 'Email',
    );
  }

  Widget _buildLocationField() {
    return const CupertinoTextField(
      prefix: Icon(
        CupertinoIcons.location_solid,
        color: CupertinoColors.lightBackgroundGray,
        size: 28,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
      clearButtonMode: OverlayVisibilityMode.editing,
      autocorrect: false,
      decoration: const BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 0, color: CupertinoColors.inactiveGray))),
      placeholder: 'Location',
    );
  }

  SliverChildBuilderDelegate _buildSliverChildBuilderDelegate(
      AppStateModel model) {
    return SliverChildBuilderDelegate((context, index) {
      switch (index) {
        case 0:
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildNameField(),
          );
        case 1:
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildEmailField(),
          );
        case 2:
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildLocationField(),
          );
        case 3:
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildDateAndTimePicker(context),
          );

        default:
      }
      return null;
    });
  }

  Widget _buildDateAndTimePicker(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Icon(
                  CupertinoIcons.clock,
                  color: CupertinoColors.lightBackgroundGray,
                  size: 28,
                ),
                SizedBox(
                  width: 6.0,
                ),
                Text(
                  'Delivery time',
                  style: Styles.deliveryTimeLabel,
                )
              ],
            ),
            Text(
              DateFormat.yMMMd().add_jm().format(dateTime),
              style: Styles.deliveryTime,
            )
          ],
        ),
        Container(
          height: _kDateTimePickerHeight,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            initialDateTime: dateTime,
            onDateTimeChanged: (newDateTime) {
              setState(() {
                dateTime = newDateTime;
              });
            },
          ),
        )
      ],
    );
  }
}
