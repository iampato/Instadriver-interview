import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instadriver/ui/live_page.dart';
import 'package:instadriver/widgets/button.dart';

class Section2Screen extends StatefulWidget {
  const Section2Screen({Key key}) : super(key: key);

  @override
  _Section2ScreenState createState() => _Section2ScreenState();
}

class _Section2ScreenState extends State<Section2Screen> {
  PageController _pageController = PageController();

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {});
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
          "Edit this section >> Personal Info",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          buildOfficialName(themeData),
          buildPhoneNumber(themeData),
          buildEmail(themeData),
          buildLocation(themeData),
          buildNationality(themeData),
          buildState(themeData),
          buildLanguage(themeData),
          buildYear(themeData),
          buildGender(themeData),
          buildMarritalStatus(themeData),
          buildDrink(themeData),
          buildSmoke(themeData),
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
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: Color(0xFF33AA44),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "90%",
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
            "Next section is “Qualification”",
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 10),
        CustomButton(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) {
                return LivePage();
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

  Column buildSmoke(ThemeData themeData) {
    return Column(
      children: [
        SizedBox(height: kToolbarHeight * 0.5),
        Text(
          "12 of 12",
          style: themeData.textTheme.headline6.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          height: kToolbarHeight,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 27,
            ),
            child: Text(
              "Do you Smoke?",
              style: themeData.textTheme.headline6,
            ),
          ),
        ),
        RadioListTile(
          value: false,
          groupValue: 1,
          onChanged: (value) {},
          title: Text("Yes"),
        ),
        RadioListTile(
          value: false,
          groupValue: 1,
          onChanged: (value) {},
          title: Text("No"),
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

  Column buildDrink(ThemeData themeData) {
    return Column(
      children: [
        SizedBox(height: kToolbarHeight * 0.5),
        Text(
          "11 of 12",
          style: themeData.textTheme.headline6.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          height: kToolbarHeight,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 27,
            ),
            child: Text(
              "Do you Drink?",
              style: themeData.textTheme.headline6,
            ),
          ),
        ),
        RadioListTile(
          value: false,
          groupValue: 1,
          onChanged: (value) {},
          title: Text("Yes"),
        ),
        RadioListTile(
          value: false,
          groupValue: 1,
          onChanged: (value) {},
          title: Text("No"),
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

  Column buildMarritalStatus(ThemeData themeData) {
    return Column(
      children: [
        SizedBox(height: kToolbarHeight * 0.5),
        Text(
          "10 of 12",
          style: themeData.textTheme.headline6.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          height: kToolbarHeight,
        ),
        Text(
          "Marital Status",
          style: themeData.textTheme.headline6,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 38,
            right: 38,
          ),
          child: DropdownButtonFormField(
            items: ["Single", "Married"].map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e.toString()),
              );
            }).toList(),
            onChanged: (value) {
              //TODO
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Select ",
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(color: Colors.grey.shade300),
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

  Column buildGender(ThemeData themeData) {
    return Column(
      children: [
        SizedBox(height: kToolbarHeight * 0.5),
        Text(
          "9 of 12",
          style: themeData.textTheme.headline6.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          height: kToolbarHeight,
        ),
        Text(
          "Gender",
          style: themeData.textTheme.headline6,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 38,
            right: 38,
          ),
          child: DropdownButtonFormField(
            items: ["Male", "Female"].map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e.toString()),
              );
            }).toList(),
            onChanged: (value) {
              //TODO
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Select gender",
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(color: Colors.grey.shade300),
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

  Column buildYear(ThemeData themeData) {
    return Column(
      children: [
        SizedBox(height: kToolbarHeight * 0.5),
        Text(
          "8 of 12",
          style: themeData.textTheme.headline6.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          height: kToolbarHeight,
        ),
        Text(
          "Year born",
          style: themeData.textTheme.headline6,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 38,
            right: 38,
          ),
          child: DropdownButtonFormField(
            items: List<int>.generate(22, (e) => e + 2000).map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e.toString()),
              );
            }).toList(),
            onChanged: (value) {
              //TODO
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Select year",
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(color: Colors.grey.shade300),
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

  Column buildLanguage(ThemeData themeData) {
    return Column(
      children: [
        SizedBox(height: kToolbarHeight * 0.5),
        Text(
          "7 of 12",
          style: themeData.textTheme.headline6.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          height: kToolbarHeight,
        ),
        Text(
          "Add Languages you speak",
          style: themeData.textTheme.headline6,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 38,
            right: 38,
          ),
          child: DropdownButtonFormField(
            items: ["Kenyan", "Ugandan", "Tanzanian", "American", "Turkish"]
                .map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e),
              );
            }).toList(),
            onChanged: (value) {
              //TODO
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Nationality",
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
            left: 20,
            right: 20,
          ),
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
                "Multiple spoken languages may be an added advantage for your profile.",
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

  Column buildState(ThemeData themeData) {
    return Column(
      children: [
        SizedBox(height: kToolbarHeight * 0.5),
        Text(
          "6 of 12",
          style: themeData.textTheme.headline6.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          height: kToolbarHeight,
        ),
        Text(
          "Your City/State",
          style: themeData.textTheme.headline6,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 38,
            right: 38,
          ),
          child: DropdownButtonFormField(
            items:
                ["Nakuru", "Nairobi", "Kisumu", "Mombasa", "Kajiado"].map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e),
              );
            }).toList(),
            onChanged: (value) {
              //TODO
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Your City/State",
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(color: Colors.grey.shade300),
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

  Column buildNationality(ThemeData themeData) {
    return Column(
      children: [
        SizedBox(height: kToolbarHeight * 0.5),
        Text(
          "5 of 12",
          style: themeData.textTheme.headline6.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          height: kToolbarHeight,
        ),
        Text(
          "Nationality",
          style: themeData.textTheme.headline6,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 38,
            right: 38,
          ),
          child: DropdownButtonFormField(
            items: ["Kenyan", "Ugandan", "Tanzanian", "American", "Turkish"]
                .map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e),
              );
            }).toList(),
            onChanged: (value) {
              //TODO
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Nationality",
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
            left: 20,
            right: 20,
          ),
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
                "What’s your nationality according to your ID or Passport?",
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

  Column buildLocation(ThemeData themeData) {
    return Column(
      children: [
        SizedBox(height: kToolbarHeight * 0.5),
        Text(
          "4 of 12",
          style: themeData.textTheme.headline6.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          height: kToolbarHeight,
        ),
        Text(
          "Residential Location",
          style: themeData.textTheme.headline6,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 20,
            right: 20,
          ),
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Westlands, Nairobi, Kenya.",
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
            left: 20,
            right: 20,
          ),
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
                "Some employers hire drivers based on their locations. Also, comrades may want to connect with comrades staying in the same town or location.",
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

  Column buildEmail(ThemeData themeData) {
    return Column(
      children: [
        SizedBox(height: kToolbarHeight * 0.5),
        Text(
          "3 of 12",
          style: themeData.textTheme.headline6.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          height: kToolbarHeight,
        ),
        Text(
          "Registered email",
          style: themeData.textTheme.headline6,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 20,
            right: 20,
          ),
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Email Address",
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
            left: 20,
            right: 20,
          ),
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
                "This is the email you used to register your Instadriver account. You cannot change it. Go to next or back to edit other parts.",
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

  Column buildPhoneNumber(ThemeData themeData) {
    return Column(
      children: [
        SizedBox(height: kToolbarHeight * 0.5),
        Text(
          "2 of 12",
          style: themeData.textTheme.headline6.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          height: kToolbarHeight,
        ),
        Text(
          "Contact phone number",
          style: themeData.textTheme.headline6,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 20,
            right: 20,
          ),
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Contact Phone Number",
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
            left: 20,
            right: 20,
          ),
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
                "This number will be visible to employers and comrades so that they can reach out to you.",
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

  Column buildOfficialName(ThemeData themeData) {
    return Column(
      children: [
        SizedBox(height: kToolbarHeight * 0.5),
        Text(
          "1 of 12",
          style: themeData.textTheme.headline6.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          height: kToolbarHeight,
        ),
        Text(
          "Your Official Name",
          style: themeData.textTheme.headline6,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 20,
            right: 20,
          ),
          child: Row(
            children: [
              Flexible(
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "First Name",
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Flexible(
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Second Name",
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
            left: 20,
            right: 20,
          ),
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
                "Put your real name so that employers and friends can recognize you. Once you add your name and confirmed it, you cannot change it again.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 40,
            right: 20,
            left: 20,
          ),
          child: InkWell(
            onTap: () {
              _pageController.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF3B3B3B),
                borderRadius: BorderRadius.circular(3),
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Text(
                  "Add Name",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
