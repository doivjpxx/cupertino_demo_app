import 'package:cupertino_app/product_list_tab.dart';
import 'package:cupertino_app/search_tab.dart';
import 'package:cupertino_app/shopping_cart_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class CupertinoStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return CupertinoApp(
      home: CupertinoStoreHomePage(),
    );
  }
}

class CupertinoStoreHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home), label: 'Products'),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search), label: 'Search'),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart), label: 'Cart'),
      ]),
      tabBuilder: (context, index) {
        CupertinoTabView returnValue;

        switch (index) {
          case 0:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: ProductListTab(),
                );
              },
            );
            break;
          case 1:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: SearchTab(),
                );
              },
            );
            break;
          case 2:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: ShoppingCartTab(),
                );
              },
            );
            break;
        }
        return returnValue;
      },
    );
  }
}
