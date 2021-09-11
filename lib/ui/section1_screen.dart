import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instadriver/widgets/button.dart';
import 'package:instadriver/widgets/switch.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class Section1Screen extends StatefulWidget {
  const Section1Screen({Key key}) : super(key: key);

  @override
  _Section1ScreenState createState() => _Section1ScreenState();
}

class _Section1ScreenState extends State<Section1Screen> {
  int _index = 0;
  PageController _pageController = PageController();
  File filename;
  File profile;
  File half;
  File cool;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        _index = _pageController.page.toInt();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit this section >> Profile  section",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 17,
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          buildProfilePic(themeData),
          buildPhoto(themeData, size),
          buildHalfSizePhoto(themeData, size),
          buildCoolPhoto(themeData, size),
          buildProfileInfo(themeData),
          buildAvailability(themeData, size),
          buildFreezeProfile(themeData, size),
          buildDone(size, themeData),
        ],
      ),
    );
  }

  Widget buildDone(Size size, ThemeData themeData) {
    return Column(
      children: [
        SizedBox(height: kToolbarHeight * 0.25),
        Image.asset("assets/unknown.png"),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Opacity(
            opacity: 0.6,
            child: Text(
              "Bravo! You completed this section. It requires a" +
                  " little patience to buld an amazing profile.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        Opacity(
          opacity: 0.6,
          child: Text(
            "Your progress bar for your Instadriver Profile",
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 17,
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 25,
                width: size.width,
                decoration: BoxDecoration(
                  color: Color(0xFf9AD4A1),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              //
              Container(
                height: 25,
                width: size.width * 0.45,
                decoration: BoxDecoration(
                  color: Color(0xFF33AA44),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "50%",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
        Image.asset(
          "assets/road.png",
          height: size.height * 0.28,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Opacity(
          opacity: 0.6,
          child: Text(
            "Next section is “Personal Information”",
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 10),
        CustomButton(
          onTap: () {
             Navigator.pop(context);
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
                  "Go to next section",
                  style: themeData.textTheme.button,
                ),
                Icon(Icons.chevron_right),
              ],
            ),
          ),
        ),
        Spacer(),
        Container(
          color: Color(0xFF9AD4A1),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  bottom: 15,
                  top: 10,
                ),
                child: Text(
                  " To build your profile from scratch to 100%. completion, it takes about 7 minutes." +
                      " You can skip and come later to continue from where you left. ",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              CustomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 25,
                  ),
                  child: Text(
                    "Skip & continue later",
                    style: themeData.textTheme.button,
                  ),
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        )
      ],
    );
  }

  Widget buildFreezeProfile(ThemeData themeData, Size size) {
    return Column(
      children: [
        SizedBox(height: kToolbarHeight * 0.5),
        Text(
          "7 of 7",
          style: themeData.textTheme.headline6.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: kToolbarHeight * 1.2),
        SizedBox(
          width: size.width * 0.7,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF1F1F1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 7,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Freeze Profile"),
                  CustomSwitch(
                    value: false,
                    activeColor: Color(0xFFFFBB00),
                    inactiveColor: Color(0xFF6B6565),
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "You cannot edit this part, because your profile is not live." +
                " Tap next until you complete this section and other sections " +
                "100%, then you will go live and you will be able to edit this part.",
            style: TextStyle(
              color: Color(0xFFF61414),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 15.0,
            left: 60,
            right: 60,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFE5E5E5),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Text(
                "Move the slider right to Freeze profile and left to unfreeze profile.\n\nWhen you freeze your account, you will not appear on search results when employers do a search on “Find & Hire A Driver” Section. Employers will not be able to find you until you unfreeze. When you freeze, also your “Hire-Me-Cards” will not be visible to employers.\n\nPlease note that freezing your account does not disable your search on Mobility Players Search.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              onTap: () {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              color: Color(0xFFC4C4C4),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 25,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.chevron_left),
                    Text(
                      "Back",
                      style: themeData.textTheme.button,
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(
              onTap: () {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
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
                      "Next",
                      style: themeData.textTheme.button,
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 25),
      ],
    );
  }

  Widget buildAvailability(ThemeData themeData, Size size) {
    return Column(
      children: [
        SizedBox(height: kToolbarHeight * 0.5),
        Text(
          "6 of 7",
          style: themeData.textTheme.headline6.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: kToolbarHeight * 1.2),
        SizedBox(
          width: size.width * 0.7,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF1F1F1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 7,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Unavailable for hire"),
                  CustomSwitch(
                    value: false,
                    activeColor: Color(0xFFFFBB00),
                    inactiveColor: Color(0xFF6B6565),
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "You cannot edit this part, because your profile is not live." +
                " Tap next until you complete this section and other sections 100%, " +
                "then you will go live and you will be able to edit this part.",
            style: TextStyle(
              color: Color(0xFFF61414),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 15.0,
            left: 60,
            right: 60,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFE5E5E5),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Text(
                "Move the slider left to go unavailable and right to enable available status.\n\nAvailable status will appear on your profile when employers view your profile. It means that you are available for hire. It doesn’t matter whether you are already hired or unemployed, when available is enabled it means you are still looking for greener pastures. If it is disabled, an Unavailable status is shown.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              onTap: () {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              color: Color(0xFFC4C4C4),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 25,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.chevron_left),
                    Text(
                      "Back",
                      style: themeData.textTheme.button,
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(
              onTap: () {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
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
                      "Next",
                      style: themeData.textTheme.button,
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 25),
      ],
    );
  }

  Widget buildProfileInfo(ThemeData themeData) {
    return Column(
      children: [
        SizedBox(height: kToolbarHeight * 0.5),
        Text(
          "5 of 7",
          style: themeData.textTheme.headline6.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: kToolbarHeight * 1.2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 0.5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 250,
                      decoration: BoxDecoration(
                        color: Color(0xFFF6F6F6),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 6.0,
                        ),
                        child: Text("Anonymous"),
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.phone_android),
                        Container(
                          width: 225,
                          height: 27,
                          decoration: BoxDecoration(
                            color: Color(0xFFF6F6F6),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
            left: 75,
            right: 75,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFE5E5E5),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: Text(
                "Don’t worry about this part. You will edit it on “Personal Info” section. The name and contact number you add there will show up here. Tap “next” to keep filling this section.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              onTap: () {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              color: Color(0xFFC4C4C4),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 25,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.chevron_left),
                    Text(
                      "Back",
                      style: themeData.textTheme.button,
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(
              onTap: () {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
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
                      "Next",
                      style: themeData.textTheme.button,
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 25),
      ],
    );
  }

  Widget buildCoolPhoto(ThemeData themeData, Size size) {
    return Column(
      children: [
        SizedBox(height: kToolbarHeight * 0.5),
        Text(
          "4 of 7",
          style: themeData.textTheme.headline6.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: 20),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Center(
              child: Container(
                height: size.height * 0.5,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
                child: Icon(Icons.camera_alt_outlined),
              ),
            ),
            Positioned(
              bottom: -25,
              right: 0,
              left: 0,
              child: IconButton(
                icon: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFE5E5E5),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Icon(Icons.edit_outlined),
                  ),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFE5E5E5),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: Text(
                "Any cool photo can do",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: Icon(
                Icons.done,
                color: Colors.white,
                size: 16,
              ),
            ),
            SizedBox(width: 10),
            Text(
              "Your photo has been added successfully",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              onTap: () {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              color: Color(0xFFC4C4C4),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 25,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.chevron_left),
                    Text(
                      "Back",
                      style: themeData.textTheme.button,
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(
              onTap: () {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
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
                      "Next",
                      style: themeData.textTheme.button,
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 25),
      ],
    );
  }

  Widget buildHalfSizePhoto(ThemeData themeData, Size size) {
    return Column(
      children: [
        SizedBox(height: kToolbarHeight * 0.5),
        Text(
          "3 of 7",
          style: themeData.textTheme.headline6.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: 20),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Center(
              child: Container(
                height: size.height * 0.5,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
                child: Icon(Icons.camera_alt_outlined),
              ),
            ),
            Positioned(
              bottom: -25,
              right: 0,
              left: 0,
              child: IconButton(
                icon: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFE5E5E5),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Icon(Icons.edit_outlined),
                  ),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFE5E5E5),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: Text(
                "It can be a half-size photo",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: Icon(
                Icons.done,
                color: Colors.white,
                size: 16,
              ),
            ),
            SizedBox(width: 10),
            Text(
              "Your photo has been added successfully",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              onTap: () {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              color: Color(0xFFC4C4C4),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 25,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.chevron_left),
                    Text(
                      "Back",
                      style: themeData.textTheme.button,
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(
              onTap: () {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
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
                      "Next",
                      style: themeData.textTheme.button,
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 25),
      ],
    );
  }

  Widget buildPhoto(ThemeData themeData, Size size) {
    return Column(
      children: [
        SizedBox(height: kToolbarHeight * 0.5),
        Text(
          "2 of 7",
          style: themeData.textTheme.headline6.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: 20),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Center(
              child: Container(
                height: size.height * 0.5,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
                child: Icon(Icons.camera_alt_outlined),
              ),
            ),
            Positioned(
              bottom: -25,
              right: 0,
              left: 0,
              child: IconButton(
                icon: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFE5E5E5),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Icon(Icons.edit_outlined),
                  ),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFE5E5E5),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: Text(
                "Preferably a full-size photo",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: Icon(
                Icons.done,
                color: Colors.white,
                size: 16,
              ),
            ),
            SizedBox(width: 10),
            Text(
              "Your photo has been added successfully",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              onTap: () {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              color: Color(0xFFC4C4C4),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 25,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.chevron_left),
                    Text(
                      "Back",
                      style: themeData.textTheme.button,
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(
              onTap: () {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
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
                      "Next",
                      style: themeData.textTheme.button,
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 25),
      ],
    );
  }

  Widget buildProfilePic(ThemeData themeData) {
    return Column(
      children: [
        SizedBox(height: kToolbarHeight * 0.5),
        Text(
          "1 of 7",
          style: themeData.textTheme.headline6.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          height: kToolbarHeight,
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Center(
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                  image: filename == null
                      ? null
                      : DecorationImage(
                          image: FileImage(filename),
                          fit: BoxFit.cover,
                        ),
                ),
                child:
                    filename != null ? null : Icon(Icons.camera_alt_outlined),
              ),
            ),
            Positioned(
              bottom: -25,
              right: 0,
              left: 0,
              child: IconButton(
                icon: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFE5E5E5),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Icon(Icons.edit_outlined),
                  ),
                ),
                onPressed: () async {
                  final List<AssetEntity> assets = await AssetPicker.pickAssets(
                    context,
                    maxAssets: 1,
                  );
                  if (assets != null) {
                    print("object");
                    File file = await assets[0].file;
                    print(file.path);
                    setState(() {
                      filename = file;
                    });
                  } else {
                    print("object22");
                  }
                },
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFE5E5E5),
                borderRadius: BorderRadius.circular(3)),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: Text(
                "Add a profile photo. A passport\nsize photo of you will work",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        Spacer(),
        filename != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Profile photo added successfully",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              )
            : SizedBox.shrink(),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              onTap: () {},
              color: Color(0xFFC4C4C4),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 25,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.chevron_left),
                    Text(
                      "Back",
                      style: themeData.textTheme.button,
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(
              onTap: () {
                print("object");
                _pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              color: Color(0xFFFFBB00),
              active: filename == null,
              activeColor: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 25,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Next",
                      style: themeData.textTheme.button,
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 25),
      ],
    );
  }
}
