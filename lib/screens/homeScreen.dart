// ignore: file_names
import 'package:chatapp/pages/callsPage.dart';
import 'package:chatapp/pages/contactPage.dart';
import 'package:chatapp/pages/messagesPage.dart';
import 'package:chatapp/pages/notificationPage.dart';
import 'package:chatapp/screens/theme.dart';
import 'package:chatapp/widgets/glowingActionButton.dart';
import 'package:chatapp/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier('Messages');

  final pages = const [
    MessagePage(),
    NotificationPage(),
    CallsPage(),
    ContactPage()
  ];
  final pageTitles = const ['Messages', 'Notifications', 'Calls', 'Contacts'];
  void onNavigationItemSelected(index) {
    title.value = pageTitles[index];
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: ValueListenableBuilder(
              valueListenable: title,
              builder: (BuildContext context, String value, _) {
                return Text(value);
              }),
          leading: Align(
            alignment: Alignment.centerRight,
            child: IconBackground(
              icon: Icons.search_rounded,
              onTap: () {
                print('object');
              },
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: Avatar.small(
                  url: 'https://sarancom.web.app/assets/img/profile-img.jpg'),
            )
          ],
        ),
        body: ValueListenableBuilder(
            valueListenable: pageIndex,
            builder: (BuildContext context, int value, _) {
              return pages[value];
            }),
        bottomNavigationBar: bottomNavigationBar(
          onItemSelected: onNavigationItemSelected,
        ));
  }
}

// ignore: camel_case_types
class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({Key? key, required this.onItemSelected})
      : super(key: key);
  final ValueChanged<int> onItemSelected;

  @override
  State<bottomNavigationBar> createState() => _bottomNavigationBarState();
}

// ignore: camel_case_types
class _bottomNavigationBarState extends State<bottomNavigationBar> {
  var selectedIndex = 0;
  void handleItemSelectted(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavigaionBarItem(
                index: 0,
                lable: 'Messages',
                icon: CupertinoIcons.bubble_left_bubble_right_fill,
                isSelected: (selectedIndex == 0),
                onTap: handleItemSelectted),
            NavigaionBarItem(
                index: 1,
                lable: 'Notification',
                icon: CupertinoIcons.bell_solid,
                isSelected: (selectedIndex == 1),
                onTap: handleItemSelectted),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GlowingActionButton(
                  color: AppColors.secondary,
                  icon: CupertinoIcons.add,
                  onPressed: () {
                    print('object');
                  }),
            ),
            NavigaionBarItem(
                index: 2,
                lable: 'Calls',
                icon: CupertinoIcons.phone_fill,
                isSelected: (selectedIndex == 2),
                onTap: handleItemSelectted),
            NavigaionBarItem(
                index: 3,
                lable: 'Contacts',
                icon: CupertinoIcons.person_2_fill,
                isSelected: (selectedIndex == 3),
                onTap: handleItemSelectted),
          ],
        ));
  }
}

class NavigaionBarItem extends StatelessWidget {
  const NavigaionBarItem(
      {Key? key,
      required this.lable,
      required this.icon,
      required this.index,
      required this.onTap,
      this.isSelected = false})
      : super(key: key);

  final int index;
  final String lable;
  final IconData icon;
  final bool isSelected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        width: 70,
        height: 75,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? Color.fromARGB(255, 239, 157, 157) : null,
            ),
            const SizedBox(height: 8),
            Text(
              lable,
              style: isSelected
                  ? const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 239, 157, 157))
                  : const TextStyle(fontSize: 11),
            )
          ],
        ),
      ),
    );
  }
}
