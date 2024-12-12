import 'package:flutter/material.dart';
import 'package:public_chat/widgets/chat_bubble_widget.dart';
import 'package:public_chat/widgets/message_box.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                children: const [
                  ChatBubbleWidget(
                      isMine: true,
                      photoUrl:
                          "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      message:
                          "This is a message from me This is a message from me This is a message from me This is a message from me This is a message from me This is a message from me This is a message from me This is a message from me This is a message from me"),
                  ChatBubbleWidget(
                      isMine: false,
                      photoUrl:
                          "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      message:
                          "This is a message from me This is a message from me This is a message from me This is a message from me This is a message from me This is a message from me This is a message from me This is a message from me This is a message from me"),
                ],
              )),
              MessageBox(
                onSendMessage: (String value) {
                  print('public chat: $value');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
