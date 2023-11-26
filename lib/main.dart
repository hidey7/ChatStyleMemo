import 'package:chat_style_memo/chat_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatListScreen(),
    );
  }
}

class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat List'),
      ),
      body: ChatList(),
    );
  }
}

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // チャットの数に合わせて調整してください
      itemBuilder: (context, index) {
        return ChatListItem(index: index);
      },
    );
  }
}

class ChatListItem extends StatelessWidget {
  final int index;

  ChatListItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text((index + 1).toString()), // チャットの相手のイニシャルなどを表示
      ),
      title: Text('Chat Partner ${index + 1}'), // チャットの相手の名前などを表示
      subtitle: Text('Last message...'), // 最後のメッセージを表示
      trailing: Text('12:34 PM'), // 最後のメッセージの時刻を表示
      onTap: () {
        // タップ時のアクションを追加
        Navigator.push(
          context,
          MaterialPageRoute(
            // builder: (context) => ChatDetailScreen(chatPartner: 'Chat Partner ${index + 1}'),
            builder: (context) => ChatScreen(),
          ),
        );
      },
    );
  }
}

class ChatDetailScreen extends StatelessWidget {
  final String chatPartner;

  ChatDetailScreen({required this.chatPartner});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chatPartner),
      ),
      body: Center(
        child: Text('Chat with $chatPartner'),
      ),
    );
  }
}
