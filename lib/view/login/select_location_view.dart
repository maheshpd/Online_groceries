import 'package:flutter/material.dart';
import 'package:oneline_grocery/common/color_extension.dart';
import 'package:oneline_grocery/common_widget/dropdown.dart';
import 'package:oneline_grocery/common_widget/round_button.dart';
import 'package:oneline_grocery/view/login/login_screen.dart';

class SelectLocationView extends StatefulWidget {
  const SelectLocationView({super.key});

  @override
  State<SelectLocationView> createState() => _SelectLocationViewState();
}

class _SelectLocationViewState extends State<SelectLocationView> {
  TextEditingController txtOTP = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            "assets/image/bottom_bg.png",
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                "assets/image/back.png",
                width: 20,
                height: 20,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/image/select_location.png",
                      width: media.width * 0.6,
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    Text(
                      "Select Your Location",
                      style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 26,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: media.width * 0.03,
                    ),
                    Text(
                      "Switch on your location to stay in tune with\nwhat's happeing in your area",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    DropDown(
                        title: "Your Zone",
                        placeholder: "Select your zone",
                        valueList: const ["Zone 1", "Zone 2"],
                        didChange: (obj) {}),
                    SizedBox(
                      height: media.width * 0.03,
                    ),
                    DropDown(
                        title: "Your Area",
                        placeholder: "Types of your area",
                        valueList: const ["Area 1", "Area 2"],
                        didChange: (obj) {}),
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    RoundButton(
                    title: "Get Started",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LogInView(),
                        ),
                      );
                    },
                  ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
