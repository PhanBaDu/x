import 'package:flutter/cupertino.dart';
import 'package:forui_assets/forui_assets.dart';

class CreatePostWidget extends StatelessWidget {
  const CreatePostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CupertinoColors.black,
            ),
            child: Icon(
              CupertinoIcons.person_fill,
              color: CupertinoColors.white,
              size: 20,
            ),
          ),
          SizedBox(width: 10),
          // Text input area
          Expanded(
            child: Text(
              'Bạn đang nghĩ gì?',
              style: TextStyle(
                color: CupertinoColors.label,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(width: 10),
          // Image icon
          Icon(FIcons.imageUp, color: CupertinoColors.black, size: 24),
        ],
      ),
    );
  }
}
