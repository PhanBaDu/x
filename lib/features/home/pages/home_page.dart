import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:forui_assets/forui_assets.dart';
import 'package:x/features/friend/pages/friend_page.dart';
import 'package:x/features/home/pages/home_children_page.dart';
import 'package:x/features/notification/pages/notification_page.dart';
import 'package:x/features/setting/pages/setting_page.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeChildrenPage(),
    const FriendPage(),
    const NotificationPage(),
    const SettingPage(),
  ];

  final List<String> _titles = ['Trang chủ', 'Bạn bè', 'Thông báo', 'Cài đặt'];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        height: 55,
        backgroundColor: CupertinoColors.systemBackground.withOpacity(0.7),
        border: Border(
          top: BorderSide(color: CupertinoColors.separator, width: 0.5),
        ),

        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(FIcons.housePlug, size: 22),
            label: _titles[0],
          ),
          BottomNavigationBarItem(
            icon: Icon(FIcons.usersRound, size: 22),
            label: _titles[1],
          ),
          BottomNavigationBarItem(
            icon: Icon(FIcons.bell, size: 22),
            label: _titles[2],
          ),
          BottomNavigationBarItem(
            icon: Icon(FIcons.settings, size: 22),
            label: _titles[3],
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            backgroundColor: CupertinoColors.systemBackground.withOpacity(0.7),
            border: Border(
              bottom: BorderSide(color: CupertinoColors.separator, width: 0.15),
            ),
            leading:CupertinoButton(
                padding: EdgeInsets.zero,
                minSize: 0,
                onPressed: () {},
                child: Icon(
                  FIcons.plus,
                  size: 24,
                  color: CupertinoColors.label,
              ),
            ),
            middle: Text(
              _titles[index],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: CupertinoColors.label,
              ),
            ),
            trailing: CupertinoButton(
                padding: EdgeInsets.zero,
                minSize: 0,
                onPressed: () {},
                child: Icon(
                  FIcons.search,
                  size: 24,
                  color: CupertinoColors.label,
              ),
            ),
          ),
          child: _pages[index],
        );
      },
    );
  }
}
