import 'package:chatapp/models/model.dart';
import 'package:chatapp/screens/chatScreen.dart';
import 'package:chatapp/screens/theme.dart';
import 'package:chatapp/widgets/avathar.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: stories(),
        ),
        SliverList(delegate: SliverChildBuilderDelegate((_delegate)))
      ],
    );
  }
}

Widget _delegate(BuildContext context, int index) {
  return messageTitle(
      messageData: MessageData(
          senderName: 'isJith',
          message: 'hei',
          messageDate: '22/04/23',
          profilePic: 'https://sarancom.web.app/assets/img/profile-img.jpg'));
}

// ignore: camel_case_types
class stories extends StatelessWidget {
  const stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: SizedBox(
        height: 134,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
                padding: EdgeInsets.only(left: 16.0, top: 8, bottom: 16)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Stories',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                    color: AppColors.textFaded),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext contex, int index) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: storyCard(
                        storyData: StoryData(
                            name: 'jith',
                            url:
                                'https://sarancom.web.app/assets/img/profile-img.jpg'),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class storyCard extends StatelessWidget {
  const storyCard({Key? key, required this.storyData}) : super(key: key);

  final StoryData storyData;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Avatar.medium(
          url: storyData.url,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            storyData.name,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 11, letterSpacing: 0.3, fontWeight: FontWeight.bold),
          ),
        ))
      ],
    );
  }
}

// ignore: camel_case_types
class messageTitle extends StatelessWidget {
  const messageTitle({Key? key, required this.messageData}) : super(key: key);

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(ChatScreen.route(messageData));
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Avatar.medium(
              url: messageData.profilePic,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    messageData.senderName,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        letterSpacing: 8.2,
                        wordSpacing: 1.5,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(
                  height: 20,
                  child: Text(
                    messageData.message,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 20.8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    '22/04/23',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 13,
                        color: AppColors.textFaded),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                    width: 18,
                    height: 19,
                    decoration: const BoxDecoration(
                        color: AppColors.secondary, shape: BoxShape.circle),
                    child: const Center(
                      child: Text(
                        '1',
                        style:
                            TextStyle(fontSize: 10, color: AppColors.textLigth),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
