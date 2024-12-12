import 'package:flutter/material.dart';

class MessageBox extends StatefulWidget {
  final ValueChanged<String> onSendMessage;
  const MessageBox({required this.onSendMessage, super.key});

  @override
  State<MessageBox> createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          controller: _controller,
          decoration: InputDecoration(
            suffix: IconButton(
                padding: EdgeInsets.only(top: 0),
                onPressed: () {
                  //TODO send message
                  widget.onSendMessage(_controller.text);
                  _controller.clear();
                },
                icon: const Icon(Icons.send)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide:
                    const BorderSide(color: Colors.black38, width: 1.0)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          ),
          onSubmitted: (value) {
            // TODO send message
            widget.onSendMessage(_controller.text);
            _controller.clear();
          },
        ),
      );
}
