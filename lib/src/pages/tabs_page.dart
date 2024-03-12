import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:news_app/src/pages/tab1_page.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavigationModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}


class _Navigation extends StatelessWidget {
  const _Navigation({super.key});

  @override
  Widget build(BuildContext context) {

    final _navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: _navigationModel.currentPage,
        onTap: (int i) => _navigationModel.currentPage = i,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'For you',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'Headlines',
          ),
        ],
      );
  }
}



class _Pages extends StatelessWidget {
  const _Pages({super.key});

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);

    return PageView(
        controller: navigationModel.pageController,
        physics: BouncingScrollPhysics(),
        //physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[

          Tab1Page(),

          Container(
            color: Colors.green,
          ),
        ],
      );
  }
}

class _NavigationModel with ChangeNotifier {
  int _currentPage = 0;
  PageController _pageController =  PageController();

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
    _pageController.animateToPage(value, duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => _pageController;

}

