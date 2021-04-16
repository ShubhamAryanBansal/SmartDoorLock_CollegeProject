import 'package:flutter/foundation.dart';

class ApplicationState extends ChangeNotifier {
  int _tabIndex = 0;
  void setTabIndex(int index) {
    _tabIndex = index;
    notifyListeners();
  }

  int getTabIndex() {
    return _tabIndex;
  }

 
}
