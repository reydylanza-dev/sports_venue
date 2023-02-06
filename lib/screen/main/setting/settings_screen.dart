import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spod_app/utils/dummy_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final users = FirebaseAuth.instance.currentUser!;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  late String name;
  late String email;

  Future<void> _update() async {
    name = users.displayName!;
    email = users.email!;
    _nameController.text = name;
    _emailController.text = email;

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                // prevent the soft keyboard from covering text fields
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    child: const Text('Update'),
                    onPressed: () async {
                      await users.updateDisplayName(_nameController.text);
                      await users.updateEmail(_emailController.text);

                      // Hide the bottom sheet
                      Navigator.of(context).pop();
                    })
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          toolbarHeight: kTextTabBarHeight,
          title: Text(
            "Settings",
            style: titleTextStyle,
          ),
          backgroundColor: backgroundColor,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Account",
                  style: subTitleTextStyle.copyWith(color: primaryColor500),
                ),
                const SizedBox(
                  height: 8,
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 75,
                          height: 75,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  "assets/images/user_profile_example.png"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              users.displayName!,
                              style: subTitleTextStyle,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () => _update()),
                            // Container(
                            //     padding: const EdgeInsets.all(4),
                            //     decoration: BoxDecoration(
                            //         color: primaryColor100.withOpacity(0.5),
                            //         borderRadius: BorderRadius.circular(8),
                            //         border: Border.all(color: primaryColor500)),
                            //     child: Text(
                            //       sampleUser.accountType,
                            //       style: descTextStyle.copyWith(
                            //           color: primaryColor500),
                            //     ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "About App",
                  style: subTitleTextStyle.copyWith(color: primaryColor500),
                ),
                InkWell(
                  onTap: () {
                    _showSnackBar(context, "Newest Version");
                  },
                  splashColor: primaryColor100,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: colorWhite),
                          child: const Icon(
                            CupertinoIcons.info_circle_fill,
                            size: 24,
                            color: darkBlue300,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Spod - Sports Venue Booking App",
                                style: normalTextStyle,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Version 1.0.0",
                                style: descTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Created by ",
                      style: normalTextStyle,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Chin & Rey",
                      style: subTitleTextStyle.copyWith(color: primaryColor500),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Icon(
                      Icons.stars,
                      color: Colors.yellow,
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  void _showSnackBar(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text(message),
      margin: const EdgeInsets.all(16),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      // margin: EdgeInsets.all(16),
    ));
  }
}
