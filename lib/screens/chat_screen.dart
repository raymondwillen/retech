import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retech/resources/colors.dart';
import 'package:retech/resources/images.dart';
import 'package:retech/resources/strings.dart';
import 'package:retech/utils/methods.dart';
import 'package:retech/widgets/custom_bottom_navigation_bar.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final mediaQueryData =
      // ignore: deprecated_member_use
      MediaQueryData.fromView(WidgetsBinding.instance.window);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mediaQueryData.size.height,
      child: Scaffold(
        backgroundColor: ColorsApp.primary,
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: 2,
          onTap: (index) {},
        ),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: SizedBox(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          hintText: 'Search here...',
                          hintStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          filled: true,
                          fillColor: ColorsApp.secondary,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: const Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: SizedBox(
                      height: mediaQueryData.size.height - 150,
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('User ${index + 1}'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          title: const Text('View Profile'),
                                          onTap: () {
                                            Navigator.of(context).pop();
                                            Methods.showSnackBar(
                                                // ignore: use_build_context_synchronously
                                                context,
                                                Strings.errConnection,
                                                "error",
                                                3);
                                          },
                                        ),
                                        ListTile(
                                          title: const Text('Chat'),
                                          onTap: () {
                                            Navigator.of(context).pop();
                                            Methods.showSnackBar(
                                                // ignore: use_build_context_synchronously
                                                context,
                                                Strings.errConnection,
                                                "error",
                                                3);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        image: const DecorationImage(
                                          image:
                                              AssetImage(Images.PROFILE_CHAT),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'User ${index + 1}',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text(
                                          'Message',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.more_vert,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          barrierColor: ColorsApp.secondary
                                              .withOpacity(0.5),
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text('Options'),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  ListTile(
                                                    title: const Text('Delete'),
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                      Methods.showSnackBar(
                                                          // ignore: use_build_context_synchronously
                                                          context,
                                                          Strings.errConnection,
                                                          "error",
                                                          3);
                                                    },
                                                  ),
                                                  ListTile(
                                                    title: const Text('Block'),
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                      Methods.showSnackBar(
                                                          // ignore: use_build_context_synchronously
                                                          context,
                                                          Strings.errConnection,
                                                          "error",
                                                          3);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: Colors.blueGrey,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
