import 'package:cupertino_app/models/app_state_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() => runApp(ChangeNotifierProvider<AppStateModel>(
      create: (_) => AppStateModel()..loadProducts(),
      child: CupertinoStoreApp(),
    ));
