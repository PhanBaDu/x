import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class FriendPage extends StatelessWidget {
  const FriendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(child: Center(child: Text('Bạn bè')));
  }
}
