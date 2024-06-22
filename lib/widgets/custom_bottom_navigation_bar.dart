import 'package:flutter/material.dart';
import 'package:retech/resources/colors.dart';
import 'package:retech/screens/chat_screen.dart';
import 'package:retech/screens/home_screen.dart';
import 'package:retech/screens/login_screen.dart';
import 'package:retech/screens/search_screen.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 0.2,
          ),
        ),
      ),
      child: ClipRRect(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorsApp.secondary,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.blueGrey,
          currentIndex: selectedIndex,
          onTap: (index) {
            if (index == 0) {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      const Home(),
                  transitionDuration: const Duration(seconds: 0),
                ),
              );
            } else if (index == 1) {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      const Search(),
                  transitionDuration: const Duration(seconds: 0),
                ),
              );
            } else if (index == 2) {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      const Chat(),
                  transitionDuration: const Duration(seconds: 0),
                ),
              );
            } else if (index == 3) {
              showDialog(
                context: context,
                barrierColor: ColorsApp.secondary.withOpacity(0.5),
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Education'),
                    content: const Text(
                        'This feature is currently under maintenance. Please wait for the next update.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            } else if (index == 4) {
              showDialog(
                context: context,
                barrierColor: ColorsApp.secondary.withOpacity(0.5),
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Profile'),
                    content: const Text(
                        'You must be logged in to access this feature.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  const LogIn(),
                              transitionDuration: const Duration(seconds: 0),
                            ),
                          );
                        },
                        child: const Text('Log In'),
                      ),
                    ],
                  );
                },
              );
            } else {
              onTap(index);
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.only(top: 5),
                child: const Icon(Icons.home),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.only(top: 5),
                child: const Icon(Icons.search),
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.only(top: 5),
                child: const Icon(Icons.chat),
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.only(top: 5),
                child: const Icon(Icons.school),
              ),
              label: 'Education',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.only(top: 5),
                child: const Icon(Icons.person),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
