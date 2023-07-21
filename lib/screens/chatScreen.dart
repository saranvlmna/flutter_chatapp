import 'package:chatapp/models/model.dart';
import 'package:chatapp/screens/theme.dart';
import 'package:chatapp/widgets/avathar.dart';
import 'package:chatapp/widgets/glowingActionButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/iconButtons.dart';

class ChatScreen extends StatelessWidget {
  static Route route(MessageData data) =>
      MaterialPageRoute(builder: (context) => ChatScreen(messageData: data));

  const ChatScreen({Key? key, required this.messageData}) : super(key: key);

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle(messageData: messageData),
        iconTheme: Theme.of(context).iconTheme,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 54,
        toolbarHeight: 100,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconBackground(
            icon: CupertinoIcons.back,
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        actions: const [],
      ),
      body: const Column(
        children: [
          Expanded(
            child: Messagess(),
          ),
          ActionBar()
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class appBarTitle extends StatelessWidget {
  const appBarTitle({Key? key, required this.messageData}) : super(key: key);
  final MessageData messageData;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Avatar.small(url: messageData.profilePic),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                messageData.senderName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Online',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            )
          ],
        ))
      ],
    );
  }
}

class Messagess extends StatelessWidget {
  const Messagess({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(children: const [
        DateLabel(lable: '21/08/23'),
        MessageTile(message: "hellooooooooooooooo", messageDate: '21/06/23'),
        MessageOwnTile(message: 'hiiiiiiiiiiiii', messageDate: '21/06/23'),
        MessageTile(message: "hellooooooooooooooo", messageDate: '21/06/23'),
        MessageOwnTile(message: 'hiiiiiiiiiiiii', messageDate: '21/06/23'),
        MessageTile(message: "hellooooooooooooooo", messageDate: '21/06/23'),
        MessageOwnTile(message: 'hiiiiiiiiiiiii', messageDate: '21/06/23'),
        DateLabel(lable: '21/09/23'),
        MessageTile(message: "hellooo", messageDate: '21/06/23'),
        MessageOwnTile(message: 'hiiiiiiiiiiiii', messageDate: '21/06/23'),
      ]),
    );
  }
}

class DateLabel extends StatelessWidget {
  const DateLabel({
    Key? key,
    required this.lable,
  }) : super(key: key);

  final String lable;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          lable,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.textFaded),
        ),
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  const MessageTile(
      {Key? key, required this.message, required this.messageDate})
      : super(key: key);

  final String message;
  final String messageDate;

  static const _borderRadius = 26.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(_borderRadius),
                  topRight: Radius.circular(_borderRadius),
                  bottomRight: Radius.circular(_borderRadius),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
                child: Text(message),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                messageDate,
                style: const TextStyle(
                  color: AppColors.textFaded,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MessageOwnTile extends StatelessWidget {
  const MessageOwnTile(
      {Key? key, required this.message, required this.messageDate})
      : super(key: key);

  final String message;
  final String messageDate;

  static const _borderRadius = 26.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_borderRadius),
                  bottomRight: Radius.circular(_borderRadius),
                  bottomLeft: Radius.circular(_borderRadius),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
                child: Text(message,
                    style: const TextStyle(
                      color: AppColors.textLigth,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                messageDate,
                style: const TextStyle(
                  color: AppColors.textFaded,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ActionBar extends StatelessWidget {
  const ActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(
                        width: 2, color: Theme.of(context).dividerColor))),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(CupertinoIcons.camera_fill),
            ),
          ),
          const Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: TextField(
              style: TextStyle(
                fontSize: 14,
              ),
              decoration: InputDecoration(
                  hintText: 'Type something....', border: InputBorder.none),
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 24.0),
            child: GlowingActionButton(
                color: AppColors.accent,
                icon: Icons.send_rounded,
                onPressed: () {
                  print('object');
                }),
          )
        ],
      ),
    );
  }
}
