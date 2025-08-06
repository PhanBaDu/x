import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:forui_assets/forui_assets.dart';
import 'package:x/features/friend/pages/friend_page.dart';
import 'package:x/features/home/pages/home_children_page.dart';
import 'package:x/features/home/screens/create_post_screen.dart';
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

  void _navigateToCreatePost(BuildContext context) {
    // Add haptic feedback for better iOS experience
    HapticFeedback.lightImpact();

    Navigator.of(context).push(
      PageRouteBuilder<void>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            CreatePostScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // iOS-style slide transition
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  void _handleSearch(BuildContext context) {
    // Add haptic feedback
    HapticFeedback.lightImpact();

    // TODO: Navigate to search page
    print('Search tapped');
  }

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
            leading: CupertinoButton(
              padding: EdgeInsets.zero,
              minSize: 0,
              pressedOpacity: 0.7,
              onPressed: () => _navigateToCreatePost(context),
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(
                  FIcons.plus,
                  size: 20,
                  color: CupertinoColors.black,
                ),
              ),
            ),
            middle: Text(
              _titles[index],
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: CupertinoColors.label,
              ),
            ),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              minSize: 0,
              pressedOpacity: 0.7,
              onPressed: () => _handleSearch(context),
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(
                  FIcons.search,
                  size: 20,
                  color: CupertinoColors.black,
                ),
              ),
            ),
          ),
          child: _pages[index],
        );
      },
    );
  }
}
