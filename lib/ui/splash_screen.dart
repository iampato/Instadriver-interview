import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instadriver/ui/account_screen.dart';
import 'package:instadriver/widgets/button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF3A3636),
      body: Column(
        children: [
          Container(
            height: size.height * 0.65,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Instadriver",
                  style: themeData.textTheme.headline4.copyWith(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 50),
                Image.asset(
                  "assets/logo.png",
                  height: 95,
                )
              ],
            ),
          ),
          Container(
            height: size.height * 0.35,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Text(
                    "A professional and social media app for drivers",
                    style: TextStyle(
                      fontSize: themeData.textTheme.headline6.fontSize * 1.1,
                    ),
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 30,
                      bottom: 35,
                    ),
                    child: CustomButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context){
                            return AccountPage();
                          }),
                        );
                      },
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
                              "Get Started",
                              style: themeData.textTheme.button,
                            ),
                            Icon(Icons.chevron_right)
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
