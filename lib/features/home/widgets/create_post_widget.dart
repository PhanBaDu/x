import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:forui_assets/forui_assets.dart';
import 'package:x/features/home/screens/create_post_screen.dart';

class CreatePostWidget extends StatelessWidget {
  const CreatePostWidget({super.key});

  void _navigateToCreatePost(BuildContext context) {
    // Add haptic feedback for better iOS experience
    HapticFeedback.lightImpact();

    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => CreatePostScreen(),
        title: 'Tạo bài viết',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      pressedOpacity: 0.8,
      onPressed: () => _navigateToCreatePost(context),
      child: Container(
        color: CupertinoColors.systemBackground,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            // Sparkle icon
            Icon(FIcons.sparkle, size: 20, color: CupertinoColors.label),
            // Text area with iOS-style background
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemBackground,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: CupertinoColors.systemBackground,
                    width: 0.5,
                  ),
                ),
                child: Text(
                  'Bạn đang nghĩ gì?',
                  style: TextStyle(
                    color: CupertinoColors.placeholderText,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),

            SizedBox(width: 12),

            // Image upload icon
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: CupertinoColors.systemGreen.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                FIcons.imageUp,
                color: CupertinoColors.systemGreen,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
