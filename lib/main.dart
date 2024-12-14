import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:public_chat/bloc/genai_bloc.dart';
import 'package:public_chat/data/chat_content.dart';
import 'package:public_chat/widgets/chat_bubble_widget.dart';
import 'package:public_chat/widgets/message_box.dart';
import 'package:public_chat/worker/genai_worker.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => GenaiBloc(),
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              Expanded(child:
                  BlocBuilder<GenaiBloc, GenaiState>(builder: (context, state) {
                final List<ChatContent> data = [];
                if (state is MessageUpdate) {
                  data.addAll(state.contents);
                }
                return ListView(
                  children: data.map((e) {
                    final bool isMine = e.sender == Sender.user;
                    return ChatBubbleWidget(
                        isMine: isMine, photoUrl: null, message: e.message);
                  }).toList(),
                );
              })),
              MessageBox(
                onSendMessage: (String value) {
                  context.read<GenaiBloc>().add(SendMessageEvent(value));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
