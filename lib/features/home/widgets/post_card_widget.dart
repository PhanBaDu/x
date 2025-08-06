import 'package:flutter/cupertino.dart';
import 'package:forui_assets/forui_assets.dart';

class PostCardWidget extends StatelessWidget {
  final String authorName;
  final String timeAgo;
  final String content;
  final String? hashtag;
  final String? imageUrl;
  final String? imageCaption;
  final String reactionsCount;
  final String commentsCount;
  final String sharesCount;
  final bool isFollowing;

  const PostCardWidget({
    super.key,
    required this.authorName,
    required this.timeAgo,
    required this.content,
    this.hashtag,
    this.imageUrl,
    this.imageCaption,
    required this.reactionsCount,
    required this.commentsCount,
    required this.sharesCount,
    this.isFollowing = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.systemBackground,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Avatar + Name + Time + Menu
          Row(
            children: [
              // Avatar
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CupertinoColors.black,
                ),
                child: ClipOval(
                  child: Icon(
                    CupertinoIcons.person_fill,
                    color: CupertinoColors.white,
                    size: 20,
                  ),
                ),
              ),
              SizedBox(width: 12),
              // Name and time
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            authorName,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: CupertinoColors.label,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          timeAgo,
                          style: TextStyle(
                            fontSize: 13,
                            color: CupertinoColors.secondaryLabel,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          FIcons.earth,
                          size: 12,
                          color: CupertinoColors.secondaryLabel,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Menu and close buttons
              Row(
                children: [
                  CupertinoButton(
                    minSize: 0,
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Icon(
                      CupertinoIcons.xmark,
                      color: CupertinoColors.secondaryLabel,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),

          // Post content
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 15,
                color: CupertinoColors.label,
                height: 1.3,
              ),
              children: [
                TextSpan(text: content),
                if (hashtag != null) ...[
                  TextSpan(text: ' '),
                  TextSpan(
                    text: hashtag,
                    style: TextStyle(color: CupertinoColors.systemBlue),
                  ),
                ],
              ],
            ),
          ),

          // Post image (if exists)
          if (imageUrl != null || imageCaption != null) ...[
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: CupertinoColors.systemGrey5,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Placeholder for image
                    Container(
                      color: CupertinoColors.systemGrey4,
                      child: Icon(
                        FIcons.imageOff,
                        size: 30,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                    // Bottom text overlay (if caption exists)
                    if (imageCaption != null)
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                CupertinoColors.black.withOpacity(0),
                                CupertinoColors.black.withOpacity(0.2),
                              ],
                            ),
                          ),
                          child: Text(
                            imageCaption!,
                            style: TextStyle(
                              color: CupertinoColors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],

          SizedBox(height: 12),

          // Reactions and stats
          Row(
            children: [
              // Phần reaction icons + count
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Icon(
                          CupertinoIcons.heart_fill,
                          size: 20,
                          color: CupertinoColors.systemRed,
                        ),
                      ],
                    ),
                    SizedBox(width: 4),
                    Text(
                      reactionsCount,
                      style: TextStyle(
                        fontSize: 14,
                        color: CupertinoColors.secondaryLabel,
                      ),
                    ),
                  ],
                ),
              ),

              // Phần bình luận
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '$commentsCount bình luận',
                      style: TextStyle(
                        fontSize: 14,
                        color: CupertinoColors.secondaryLabel,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 12),
          // Action buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Like button
              CupertinoButton(
                padding: EdgeInsets.zero, // xóa padding thừa
                minSize: 0,
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.heart,
                      size: 20,
                      color: CupertinoColors.secondaryLabel,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Thích',
                      style: TextStyle(
                        fontSize: 15,
                        color: CupertinoColors.secondaryLabel,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              // Comment button
              CupertinoButton(
                padding: EdgeInsets.zero,
                minSize: 0,
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      FIcons.messageCircle,
                      size: 20,
                      color: CupertinoColors.secondaryLabel,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Bình luận',
                      style: TextStyle(
                        fontSize: 15,
                        color: CupertinoColors.secondaryLabel,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
