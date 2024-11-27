import 'package:flutter/material.dart';
import 'package:scanalyze_app/pages/dashboard/dashboard_page.dart';
import 'package:scanalyze_app/utils/constants/colors.dart';
import 'package:scanalyze_app/utils/constants/sizes.dart';
import 'package:scanalyze_app/utils/helpers/helper_functions.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  List<Widget> get _widgetOptions => <Widget>[
        DashboardPage(),
        const Text(
          'Index 1: Documents',
          style: TextStyle(fontSize: 24),
        ),
        const Text(
          'Index 2: Upload Document',
          style: TextStyle(fontSize: 24),
        ),
        const Text(
          'Index 3: Notifications',
          style: TextStyle(fontSize: 24),
        ),
        const Text(
          'Index 4: Profile',
          style: TextStyle(fontSize: 24),
        ),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: Material(
        elevation: 10,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: ScanalyzeColors.grey),
                ),
              ),
              child: BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: ScanalyzeSizes.fontSizeXs, color: ScanalyzeColors.primaryColor),
                unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: ScanalyzeSizes.fontSizeXs, color: ScanalyzeColors.grey),
                type: BottomNavigationBarType.fixed,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.folder_outlined),
                    activeIcon: Icon(Icons.folder),
                    label: 'Documents',
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox.shrink(),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.notifications_none_outlined),
                    activeIcon: Icon(Icons.notifications),
                    label: 'Notifications',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    activeIcon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
            Positioned(
              top: -20,
              left: ScanalyzeHelperFunctions.screenWidth(context) * 0.5 - 28,
              child: FloatingActionButton(
                onPressed: () {
                  _onItemTapped(2);
                },
                child: const Icon(Icons.add, color: ScanalyzeColors.white,),
                backgroundColor: ScanalyzeColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}