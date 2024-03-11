export 'package:news_app/src/pages/tab1_page.dart';
export 'package:news_app/src/pages/tab2_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Pages(),
      bottomNavigationBar: _Navigation(),
    );
  }
}


class _Navigation extends StatelessWidget {
  const _Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
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
    return PageView(
        //physics: BouncingScrollPhysics(),
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
        ],
      );
  }
}

