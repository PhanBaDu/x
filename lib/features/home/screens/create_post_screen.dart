import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart'; // For haptic feedback
import 'package:forui_assets/forui_assets.dart';

class CreatePostWidget extends StatelessWidget {
  const CreatePostWidget({super.key});

  void _navigateToCreatePost(BuildContext context) {
    // Haptic feedback như native iOS
    HapticFeedback.lightImpact();

    // Navigation với iOS style
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => CreatePostScreen(),
        title: 'Tạo bài viết', // Title cho navigation
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.systemBackground,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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

            SizedBox(width: 12),

            // Text input area - CupertinoButton với iOS style
            Expanded(
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                pressedOpacity: 0.8, // Hiệu ứng nhấn iOS
                borderRadius: BorderRadius.circular(20),
                onPressed: () => _navigateToCreatePost(context),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey6,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: CupertinoColors.systemGrey4,
                      width: 0.5,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Bạn đang nghĩ gì?',
                      style: TextStyle(
                        color: CupertinoColors.secondaryLabel,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(width: 12),

            // Image icon - CupertinoButton
            CupertinoButton(
              padding: EdgeInsets.all(8),
              minSize: 0,
              borderRadius: BorderRadius.circular(8),
              pressedOpacity: 0.6,
              onPressed: () => _navigateToCreatePost(context),
              child: Icon(
                FIcons.imageUp,
                color: CupertinoColors.activeGreen,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool get _canPost => _textController.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _textController.addListener(() => setState(() {}));

    // Auto focus với delay nhỏ để mượt hơn
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 300), () {
        if (mounted) _focusNode.requestFocus();
      });
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleImagePick() {
    HapticFeedback.lightImpact();
    // Implement image picker
    print('Image picker clicked');
  }

  void _handlePost() {
    if (!_canPost) return;

    HapticFeedback.mediumImpact();
    print('Posting: ${_textController.text}');

    // Show loading hoặc success feedback
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('Thành công'),
        content: Text('Bài viết đã được đăng'),
        actions: [
          CupertinoDialogAction(
            child: Text('OK'),
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Back to previous screen
            },
          ),
        ],
      ),
    );
  }

  void _handleCancel() {
    if (_textController.text.trim().isEmpty) {
      Navigator.pop(context);
      return;
    }

    // Show confirmation dialog if user has typed something
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('Bỏ bài viết?'),
        content: Text('Bạn có chắc muốn bỏ bài viết này không?'),
        actions: [
          CupertinoDialogAction(
            child: Text('Tiếp tục chỉnh sửa'),
            onPressed: () => Navigator.pop(context),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: Text('Bỏ'),
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Back to previous screen
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBackground,
        border: Border(
          bottom: BorderSide(color: CupertinoColors.systemGrey4, width: 0.5),
        ),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Text(
            'Hủy',
            style: TextStyle(color: CupertinoColors.systemBlue, fontSize: 17),
          ),
          onPressed: _handleCancel,
        ),
        middle: Text(
          'Bài viết mới',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Text(
            'Đăng',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17,
              color: _canPost
                  ? CupertinoColors.systemBlue
                  : CupertinoColors.inactiveGray,
            ),
          ),
          onPressed: _canPost ? _handlePost : null,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Header với avatar
            Container(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: CupertinoColors.black,
                    ),
                    child: Icon(
                      CupertinoIcons.person_fill,
                      color: CupertinoColors.white,
                      size: 22,
                    ),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tên của bạn',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: CupertinoColors.label,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.globe,
                            size: 12,
                            color: CupertinoColors.secondaryLabel,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Công khai',
                            style: TextStyle(
                              fontSize: 13,
                              color: CupertinoColors.secondaryLabel,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Text input
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: CupertinoTextField.borderless(
                  controller: _textController,
                  focusNode: _focusNode,
                  placeholder: 'Bạn đang nghĩ gì?',
                  placeholderStyle: TextStyle(
                    color: CupertinoColors.placeholderText,
                    fontSize: 17,
                  ),
                  style: TextStyle(
                    fontSize: 17,
                    color: CupertinoColors.label,
                    height: 1.4,
                  ),
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  textInputAction: TextInputAction.newline,
                ),
              ),
            ),

            // Bottom toolbar
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CupertinoColors.systemBackground,
                border: Border(
                  top: BorderSide(
                    color: CupertinoColors.systemGrey5,
                    width: 0.5,
                  ),
                ),
              ),
              child: Row(
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    minSize: 0,
                    borderRadius: BorderRadius.circular(20),
                    color: CupertinoColors.systemGreen.withOpacity(0.1),
                    pressedOpacity: 0.7,
                    onPressed: _handleImagePick,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          FIcons.imageUp,
                          color: CupertinoColors.systemGreen,
                          size: 18,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Ảnh/Video',
                          style: TextStyle(
                            color: CupertinoColors.systemGreen,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Spacer(),

                  // Character counter (tùy chọn)
                  Text(
                    '${_textController.text.length}/500',
                    style: TextStyle(
                      fontSize: 13,
                      color: _textController.text.length > 450
                          ? CupertinoColors.systemRed
                          : CupertinoColors.secondaryLabel,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
