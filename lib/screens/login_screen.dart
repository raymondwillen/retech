import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retech/resources/colors.dart';
import 'package:retech/resources/strings.dart';
import 'package:retech/screens/home_screen.dart';
import 'package:retech/screens/signup_screen.dart';
import 'package:retech/utils/methods.dart';
import 'package:retech/utils/shared_pref.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final mediaQueryData =
      // ignore: deprecated_member_use
      MediaQueryData.fromView(WidgetsBinding.instance.window);
  final textInpControllerEmail = TextEditingController();
  final textInpControllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;
  bool isRememberMe = false;

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
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            backgroundColor: ColorsApp.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(Strings.skip,
                              style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            SharedPref.setIsLoggedIn(false);
                            SharedPref.setUserInfo('', 'Guest User');
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                              return const Home();
                            }));
                          },
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 30,
                          fontFamily: 'SairaStencil',
                          letterSpacing: 1,
                        ),
                        Strings.welcome,
                      ),
                      const Text(
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                        Strings.logInToContinue,
                      ),
                      const SizedBox(height: 35),
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
                      const SizedBox(height: 5),
                      Row(children: [
                        Checkbox(
                          value: isRememberMe,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onChanged: (value) {
                            setState(() {
                              isRememberMe = value!;
                            });
                          },
                        ),
                        const Text(
                          Strings.rememberMe,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            // ignore: use_build_context_synchronously
                            Methods.showSnackBar(
                                context, Strings.errConnection, "error", 3);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            shadowColor: Colors.transparent,
                          ),
                          child: const Text(
                            Strings.forgotPassword,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ]),
                      const SizedBox(height: 5),
                      ElevatedButton(
                          onPressed: () async {
                            if (await Methods.checkConnection()) {
                              if (_formKey.currentState!.validate()) {
                                Methods.showSnackBar(
                                    // ignore: use_build_context_synchronously
                                    context,
                                    Strings.errConnection,
                                    "error",
                                    3);
                              }
                            } else {
                              Methods.showSnackBar(
                                  // ignore: use_build_context_synchronously
                                  context,
                                  Strings.errConnection,
                                  "error",
                                  3);
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
                            Strings.logIn,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          )),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            Strings.dontHaveAccount,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) {
                                return const SignUp();
                              }));
                            },
                            child: const Text(
                              Strings.signUp,
                              style: TextStyle(
                                fontSize: 16,
                                color: ColorsApp.secondary,
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
