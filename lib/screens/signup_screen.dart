// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retech/resources/colors.dart';
import 'package:retech/resources/strings.dart';
import 'package:retech/screens/login_screen.dart';
import 'package:retech/utils/methods.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isCheckBoxTerms = false;
  // ignore: deprecated_member_use
  final mediaQueryData =
      // ignore: deprecated_member_use
      MediaQueryData.fromView(WidgetsBinding.instance.window);
  final _formKey = GlobalKey<FormState>();

  final textInpControllerName = TextEditingController();
  final textInpControllerEmail = TextEditingController();
  final textInpControllerPassword = TextEditingController();
  final textInpControllerCPassword = TextEditingController();
  final textInpControllerPhone = TextEditingController();

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mediaQueryData.size.height,
      child: Scaffold(
        backgroundColor: ColorsApp.primary,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 30,
                          fontFamily: 'SairaStencil',
                          letterSpacing: 1,
                        ),
                        Strings.signUp,
                      ),
                      const SizedBox(height: 45),
                      TextFormField(
                        controller: textInpControllerName,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration:
                            Methods.getEditInputTextDecoration(Strings.name),
                        style: const TextStyle(color: Colors.black),
                        validator: (text) {
                          if (text != null && text.isNotEmpty) {
                            if (text.length < 3) {
                              return Strings.errValidName;
                            }
                          } else {
                            return Strings.errValidName;
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: textInpControllerEmail,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration:
                            Methods.getEditInputTextDecoration(Strings.email),
                        style: const TextStyle(color: Colors.black),
                        validator: (text) {
                          if (text != null && text.isNotEmpty) {
                            if (!Methods.validateEmail(text)) {
                              return Strings.errValidEmail;
                            }
                          } else {
                            return Strings.errValidEmail;
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: textInpControllerPassword,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !isPasswordVisible,
                        decoration: Methods.getEditInputPasswordTextDecoration(
                            Strings.password, isPasswordVisible, () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        }),
                        style: const TextStyle(color: Colors.black),
                        validator: (text) {
                          if (text != null && text.isNotEmpty) {
                            if (text.length < 6) {
                              return Strings.errValidPassword;
                            }
                          } else {
                            return Strings.errValidPassword;
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: textInpControllerCPassword,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !isPasswordVisible,
                        decoration: Methods.getEditInputPasswordTextDecoration(
                            Strings.confirmPassword, isPasswordVisible, () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        }),
                        style: const TextStyle(color: Colors.black),
                        validator: (text) {
                          if (text != null && text.isNotEmpty) {
                            if (text != textInpControllerPassword.text) {
                              return Strings.errValidConfirmPassword;
                            }
                          } else {
                            return Strings.errValidConfirmPassword;
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: textInpControllerPhone,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.phone,
                        decoration:
                            Methods.getEditInputTextDecoration(Strings.phone),
                        style: const TextStyle(color: Colors.black),
                        validator: (text) {
                          if (text != null && text.isNotEmpty) {
                            if (text.length < 10) {
                              return Strings.errValidPhone;
                            }
                          } else {
                            return Strings.errValidPhone;
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Checkbox(
                            value: isCheckBoxTerms,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onChanged: (value) {
                              setState(() {
                                isCheckBoxTerms = value!;
                              });
                            },
                          ),
                          const Text(
                            Strings.isAgree,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              Strings.termsAndConditions,
                              style: TextStyle(
                                color: ColorsApp.secondary,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                          onPressed: () async {
                            if (await Methods.checkConnection()) {
                              if (_formKey.currentState!.validate()) {
                                Methods.showSnackBar(
                                    context, Strings.errConnection, "error", 3);
                              }
                            } else {
                              Methods.showSnackBar(
                                  context, Strings.errConnection, "error", 3);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(15),
                            backgroundColor: ColorsApp.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            Strings.signUp,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          )),
                      const SizedBox(height: 35),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Strings.alreadyHaveAccount,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) {
                                return const LogIn();
                              }));
                            },
                            child: const Text(
                              Strings.logIn,
                              style: TextStyle(
                                color: ColorsApp.secondary,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
