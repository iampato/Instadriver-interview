import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instadriver/ui/home_page.dart';
import 'package:instadriver/widgets/button.dart';
import 'package:instadriver/widgets/clipper.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int _index = 0;
  PageController _pageController;
  @override
  void initState() {
    _pageController = PageController()
      ..addListener(() {
        setState(() {
          _index = _pageController.page.toInt();
        });
      });

    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (_index == 1) {
          _pageController.jumpToPage(0);
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            RegisterPage(
              controller: _pageController,
            ),
            LoginPage(
              controller: _pageController,
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  final PageController controller;
  const LoginPage({Key key, this.controller}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool password = false;
  bool email = false;
  @override
  void initState() {
    emailController.addListener(() {
      setState(() {});
    });
    passwordController.addListener(() {
      setState(() {
        // if(passwordController.tex
        print('Second text field: ${passwordController.text}');
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    emailController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: kToolbarHeight,
                  left: 20,
                  right: 20,
                ),
                child: Text(
                  "Sign In",
                  style: themeData.textTheme.headline5.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 25,
                  horizontal: 20,
                ),
                child: SvgPicture.asset("assets/Vector.svg"),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 10,
                ),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF5F5F5),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Email Address",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF5F5F5),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Password",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 30,
                ),
                child: CustomButton(
                  onTap: () {
                    //TODO
                  },
                  active: passwordController.text.isEmpty &&
                      emailController.text.isEmpty,
                  activeColor: Colors.grey,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 25,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Sign in",
                          style: themeData.textTheme.subtitle1.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 17,
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Spacer(),
              ClipPath(
                clipper: BottomWaveClipper(),
                child: Container(
                  color: Color(0xFFFFBB00),
                  width: double.infinity,
                  height: size.height * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 25,
                          bottom: 15,
                        ),
                        child: Text(
                          "New to Instadriver?",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          bottom: 20,
                        ),
                        child: CustomButton(
                          onTap: () {
                            widget.controller.jumpToPage(0);
                          },
                          active: false,
                          color: Colors.white24,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 25,
                            ),
                            child: Text(
                              "Create an account",
                              style: themeData.textTheme.subtitle1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RegisterPage extends StatefulWidget {
  final PageController controller;
  const RegisterPage({Key key, this.controller}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _terms = false;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController password1Controller;

  @override
  void initState() {
    emailController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    passwordController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    password1Controller = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    emailController?.dispose();
    passwordController?.dispose();
    password1Controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: kToolbarHeight,
                  left: 20,
                  right: 20,
                ),
                child: Text(
                  "Create an account",
                  style: themeData.textTheme.headline5.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Text(
                  "Only sign up if you are a driver aka comrade. Yeah, this is an app exclusive for drivers!",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF5F5F5),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Email Address",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF5F5F5),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Password",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                child: TextFormField(
                  controller: password1Controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF5F5F5),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Confirm Password",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 7,
                  top: 15,
                ),
                child: CheckboxListTile(
                  value: _terms,
                  onChanged: (value) {
                    setState(() {
                      _terms = value;
                    });
                  },
                  title: RichText(
                    text: TextSpan(
                      text: "I agree to ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "Terms & Conditions",
                          style: TextStyle(color: Color(0xFFFFBB00)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 10,
                ),
                child: CustomButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) {
                        return SuccessProfileCreatingPage();
                      }),
                    );
                  },
                  activeColor: Colors.grey,
                  active: emailController.text.isEmpty &&
                      passwordController.text.isEmpty &&
                      password1Controller.text.isEmpty,
                  color: Color(0xFFFFBB00),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 25,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Create account",
                          style: themeData.textTheme.button,
                        ),
                        Icon(Icons.chevron_right),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              ClipPath(
                clipper: BottomWaveClipper(),
                child: Container(
                  color: Color(0xFF3A3636),
                  width: double.infinity,
                  height: size.height * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 22,
                          bottom: 10,
                        ),
                        child: Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          bottom: 20,
                        ),
                        child: CustomButton(
                          onTap: () {
                            widget.controller.jumpToPage(1);
                          },
                          active: false,
                          color: Colors.white12,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 25,
                            ),
                            child: Text(
                              "Sign In",
                              style: themeData.textTheme.subtitle1.copyWith(
                                color: Color(0xFFFFBB00),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SuccessProfileCreatingPage extends StatelessWidget {
  const SuccessProfileCreatingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.asset("assets/driving-license.png")),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 15,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFE6EDF3),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Text(
                        "Congrats & Welcome",
                        style: themeData.textTheme.headline6,
                      ),
                      SizedBox(height: 10),
                      Text(
                          "Congrats for creating an account. That’s one step closer to the world of opportunities. \n\nBecause, you have not created a profile, no one knows you are on Instadriver.\n\nNow, you need to fill your profile for you to go live so that employers and other drivers can connect with you. Also, once you create your profile, you will be able to use our amazing features like posting job cards, create social groups, play online multiplayer games et cetera! \n\nLet’s dive into creating your profile! ")
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              bottom: 20,
            ),
            child: CustomButton(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) {
                    return HomePage();
                  }),
                );
              },
              active: false,
              color: Color(0xFFFFBB00),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 25,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Create profile",
                      style: themeData.textTheme.button,
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
