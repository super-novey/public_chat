import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ChatBubbleWidget extends StatelessWidget {
  final bool isMine;
  final String? photoUrl;
  final String message;

  final double _iconSize = 32.0;
  const ChatBubbleWidget(
      {required this.isMine,
      required this.photoUrl,
      required this.message,
      super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [];

    // user avatar
    widgets.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: photoUrl == null
            ? const _DefaultPersonWidget()
            : CachedNetworkImage(
                imageUrl: photoUrl!,
                width: _iconSize,
                height: _iconSize,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) =>
                    const _DefaultPersonWidget(),
                placeholder: (context, url) => const _DefaultPersonWidget()),
      ),
    ));

    // message bubble
    widgets.add(Container(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: isMine ? Colors.black26 : Colors.black87),
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      child: Text(
        message,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Colors.white),
      ),
    ));

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment:
          isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: isMine ? widgets.reversed.toList() : widgets,
    );
  }
}

class _DefaultPersonWidget extends StatelessWidget {
  const _DefaultPersonWidget({super.key});

  @override
  Widget build(BuildContext context) => const Icon(
        Icons.person,
        color: Colors.black,
        size: 12,
      );
}
