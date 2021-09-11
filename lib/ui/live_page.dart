import 'package:flutter/material.dart';
import 'package:instadriver/widgets/button.dart';

class LivePage extends StatelessWidget {
  const LivePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: Column(
        children: [
          Container(
            height: size.height * 0.57,
            width: size.width,
            child: Column(
              children: [
                SizedBox(height: 50),
                Text(
                  "CONGRATS. YOU ARE NOW LIVE",
                  style: themeData.textTheme.headline6.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  "assets/congrats-illustration.png",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        height: 25,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Color(0xFF33AA44),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "100%",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Your profile is now 100% done and you have gone live." +
                        " Employers and comrades can now find you on Instadriver." +
                        " Enjoy the cool features of Instadriver app.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: size.height * 0.43,
            width: size.width,
            decoration: BoxDecoration(
              color: Color(0xFF575353),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Text(
                    "You can try out these features:",
                    style: TextStyle(
                      fontSize: themeData.textTheme.subtitle1.fontSize,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 30,
                    left: 30,
                    top: 20,
                  ),
                  child: SizedBox(
                    width: size.width,
                    child: CustomButton(
                      onTap: () {
                        //TODO
                      },
                      color: Color(0xFFFFBB00),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 25,
                          ),
                          child: Text(
                            "Get Started",
                            style: themeData.textTheme.headline6,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 30,
                    left: 30,
                    top: 15,
                  ),
                  child: SizedBox(
                    width: size.width,
                    child: CustomButton(
                      onTap: () {
                        //TODO
                      },
                      color: Colors.white,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 25,
                          ),
                          child: Text(
                            "Post a “Hire-Me-Card”",
                            style: themeData.textTheme.headline6,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 30,
                    left: 30,
                    top: 15,
                  ),
                  child: SizedBox(
                    width: size.width,
                    child: CustomButton(
                      onTap: () {
                        //TODO
                      },
                      color: Colors.white,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 25,
                          ),
                          child: Text(
                            "Get Social",
                            style: themeData.textTheme.headline6,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 30,
                    left: 30,
                    top: 15,
                  ),
                  child: SizedBox(
                    width: size.width,
                    child: CustomButton(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      color: Colors.white,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 25,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.home),
                              SizedBox(width: 5),
                              Text(
                                "Go to Home",
                                style: themeData.textTheme.headline6,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
