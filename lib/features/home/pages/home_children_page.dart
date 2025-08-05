import 'package:flutter/cupertino.dart';
import 'package:x/features/home/widgets/create_post_widget.dart';
import 'package:x/features/home/widgets/post_card_widget.dart';

class HomeChildrenPage extends StatelessWidget {
  const HomeChildrenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Post creation card
            CreatePostWidget(),

            // Section 2: Separator
            Container(
              height: 8,
              width: double.infinity,
              color: CupertinoColors.systemFill,
            ),

            // Section 3: Post cards
            PostCardWidget(
              authorName: 'ALW - Anime/Manga Fanp...',
              timeAgo: '29 thg 7',
              content: 'Muichiro nghĩ ngờ nhân sinh! 😂',
              hashtag: '#otakusic',
              imageCaption:
                  'Tanjiro tại sao cậu lại có đôi mắt màu đỏ của gia tộc tổ chứ?',
              reactionsCount: '57,8K',
              commentsCount: '3,8K',
              sharesCount: '256',
              isFollowing: true,
            ),

            // Add more posts here
            Container(
              height: 8,
              width: double.infinity,
              color: CupertinoColors.systemFill,
            ),

            PostCardWidget(
              authorName: 'Naruto Fan Club',
              timeAgo: '2 giờ',
              content: 'Hokage mạnh nhất là ai? 🔥',
              hashtag: '#naruto',
              reactionsCount: '12,5K',
              commentsCount: '890',
              sharesCount: '45',
              isFollowing: false,
            ),
          ],
        ),
      ),
    );
  }
}
