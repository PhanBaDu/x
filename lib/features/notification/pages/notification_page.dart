import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Notification Page')));
  }
}
