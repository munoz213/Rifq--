import 'package:rifq/screens/home_page/home_page.dart';

import '../../../constants.dart';
import '../bloc/tab_bar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../settings/settings_screen.dart';

class TabBarPage extends StatelessWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TabBarBloc>(
      create: (BuildContext context) => TabBarBloc(),
      child: BlocConsumer<TabBarBloc, TabBarState>(
        listener: (context, state) {},
        buildWhen: (_, currState) =>
            currState is TabBarInitial || currState is TabBarItemSelectedState,
        builder: (context, state) {
          final bloc = BlocProvider.of<TabBarBloc>(context);
          return Scaffold(
            body: _createBody(context, bloc.currentIndex),
            bottomNavigationBar: _createdBottomTabBar(context),
          );
        },
      ),
    );
  }

  Widget _createdBottomTabBar(BuildContext context) {
    final bloc = BlocProvider.of<TabBarBloc>(context);
    return BottomNavigationBar(
      currentIndex: bloc.currentIndex,
      fixedColor: kPrimaryColor,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: bloc.currentIndex == 0 ? kPrimaryColor : null,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.gps_not_fixed_outlined,
            color: bloc.currentIndex == 1 ? kPrimaryColor : null,
          ),
          label: "Shelters",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.document_scanner,
            color: bloc.currentIndex == 2 ? kPrimaryColor : null,
          ),
          label: "Activities",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            color: bloc.currentIndex == 3 ? kPrimaryColor : null,
          ),
          label: "Settings",
        ),
      ],
      onTap: (index) {
        bloc.add(TabBarItemTappedEvent(index: index));
      },
    );
  }

  Widget _createBody(BuildContext context, int index) {
    final children = [
      SettingsScreen(),
      HomePage(),
      SettingsScreen(),
      SettingsScreen()
      // Scaffold(
      //   body: Center(
      //     child: RawMaterialButton(
      //       fillColor: Colors.red,
      //       child: Text(
      //         TextConstants.signOut,
      //         style: TextStyle(
      //           color: ColorConstants.white,
      //         ),
      //       ),
      //       onPressed: () {
      //         AuthService.signOut();
      //         Navigator.pushReplacement(
      //           context,
      //           MaterialPageRoute(builder: (_) => SignInPage()),
      //         );
      //       },
      //     ),
      //   ),
      // ),
    ];
    return children[index];
  }
}
