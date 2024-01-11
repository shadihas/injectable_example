import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class ChatBody extends StatefulWidget {
  final List messages;
  const ChatBody({super.key, required this.messages});

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 5,
      ),
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: widget.messages[index]['isUserMessage']
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ChatBubble(
              clipper: ChatBubbleClipper8(
                  type: widget.messages[index]['isUserMessage']
                      ? BubbleType.sendBubble
                      : BubbleType.receiverBubble),
              backGroundColor: widget.messages[index]['isUserMessage']
                  ? Colors.blue
                  : Colors.grey,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 50,
                ),
                child: Text(
                  widget.messages[index]['message'].text.text[0],
                  style: const TextStyle(
                      textBaseline: TextBaseline.alphabetic,
                      color: Colors.white),
                ),
              ),
            )
          ],
        );
      },
      itemCount: widget.messages.length,
    );
  }
}
