import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:markdown_widget/markdown_widget.dart';

import '../markdown/code_wrapper.dart';
import '../markdown/latex.dart';
import '../models/message.dart';
import '../states/message_state.dart';
import '../states/chat_ui_state.dart';
import 'typing_cursor.dart';

class ChatMessageList extends HookConsumerWidget {
  const ChatMessageList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(activeSessionMessagesProvider);
    final uiState = ref.watch(chatUiProvider);
    final listController = useScrollController();
    ref.listen(activeSessionMessagesProvider, (previous, next) {
      Future.delayed(const Duration(milliseconds: 50), () {
        listController.jumpTo(
          listController.position.maxScrollExtent,
        );
      });
    });
    return ListView.separated(
      controller: listController,
      itemBuilder: (context, index) {
        final msg = messages[index];
        return msg.isUser
            ? SentMessageItem(
          message: msg,
          backgroundColor: const Color(0xFF8FE869),
        )
            : ReceivedMessageItem(
          message: msg,
          typing: index == messages.length - 1 && uiState.requestLoading,
        );
      },
      itemCount: messages.length, // 消息数量
      separatorBuilder: (context, index) => const Divider(
        // 分割线
        height: 16,
        color: Colors.transparent,
      ),
    );
  }
}

class ReceivedMessageItem extends StatelessWidget {
  final Color backgroundColor;
  final double radius;
  final bool typing;
  const ReceivedMessageItem({
    super.key,
    required this.message,
    this.backgroundColor = Colors.white,
    this.radius = 8,
    this.typing = false,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: SvgPicture.asset(
            "assets/images/chatgpt.svg",
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        CustomPaint(
          painter: Triagnle(backgroundColor),
        ),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(radius),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            margin: const EdgeInsets.only(right: 48),
            child: MessageContentWidget(
              message: message,
              typing: typing,
            ),
          ),
        ),
      ],
    );
  }
}

class SentMessageItem extends StatelessWidget {
  final Color backgroundColor;
  final double radius;
  const SentMessageItem({
    super.key,
    required this.message,
    this.backgroundColor = Colors.white,
    this.radius = 8,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(radius),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            margin: const EdgeInsets.only(left: 48),
            child: MessageContentWidget(
              message: message,
            ),
          ),
        ),
        CustomPaint(
          painter: Triagnle(backgroundColor),
        ),
        const SizedBox(
          width: 8,
        ),
        const CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              'A',
              style: TextStyle(
                color: Colors.white,
              ),
            )),
      ],
    );
  }
}

class MessageContentWidget extends StatelessWidget {
  final bool typing;
  const MessageContentWidget({
    super.key,
    required this.message,
    this.typing = false,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    codeWrapper(child, text) => CodeWrapperWidget(child: child, text: text);
    return SelectionArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...MarkdownGenerator(
            config: MarkdownConfig().copy(configs: [
              const PreConfig().copy(wrapper: codeWrapper),
            ]),
            generators: [
              latexGenerator,
            ],
            inlineSyntaxes: [
              LatexSyntax(),
            ],
          ).buildWidgets(message.content),
          if (typing) const TypingCursor(),
        ],
      ),
    );
  }
}

class Triagnle extends CustomPainter {
  final Color bgColor;

  Triagnle(this.bgColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = bgColor;

    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(5, 10);
    path.lineTo(10, 0);
    canvas.translate(-5, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
