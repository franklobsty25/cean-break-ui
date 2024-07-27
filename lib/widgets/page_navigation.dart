import 'package:designing/common.dart';

class PageNavigation extends StatefulWidget {
  const PageNavigation({super.key});

  @override
  State<PageNavigation> createState() => _PageNavigationState();
}

class _PageNavigationState extends State<PageNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              LineAwesomeIcons.home_solid,
            ),
            label: 'Home',
            activeIcon: Icon(LineAwesomeIcons.home_solid),
          ),
          const BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.chart_pie_solid),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.only(top: 1.h),
              padding: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                LineAwesomeIcons.plus_solid,
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.user_friends_solid),
            label: 'Community',
          ),
          const BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.sliders_h_solid),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
      ),
      body: _pageNavigationViews().elementAt(_selectedIndex),
    );
  }

  List<Widget> _pageNavigationViews() => [
        HomeScreen(),
        HomeScreen(),
        HomeScreen(),
        HomeScreen(),
        HomeScreen(),
      ];
}
