
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oneline_grocery/common/color_extension.dart';
import 'package:oneline_grocery/common_widget/round_button.dart';
import 'package:oneline_grocery/view/login/verification_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController txtMobile = TextEditingController();
  FlCountryCodePicker countryCodePicker = const FlCountryCodePicker();
  late CountryCode countryCode;

  @override
  void initState() {
    super.initState();
    countryCode = countryCodePicker.countryCodes
        .firstWhere((element) => element.name == "India");
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  void dispose() {
    super.dispose();
    txtMobile.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  "assets/image/bottom_bg.png",
                  width: media.width,
                  height: media.height,
                  fit: BoxFit.cover,
                )
              ],
            ),
            Image.asset(
              "assets/image/sign_in_top.png",
              width: media.width,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
              SizedBox(
                height: media.width * 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      "Get your groceries\nwith nectar",
                      style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 26,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextField(
                      controller: txtMobile,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          prefixIcon: GestureDetector(
                              onTap: () async {
                                final code = await countryCodePicker
                                    .showPicker(context: context);

                                if (code != null) {
                                  countryCode = code;
                                  if (mounted) {
                                    setState(() {});
                                  }
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.only(right: 15),
                                    width: 35,
                                    height: 35,
                                    child: countryCode.flagImage(),
                                  ),
                                  Text(
                                    countryCode.dialCode,
                                    style: TextStyle(
                                        color: TColor.primaryText,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                ],
                              )),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: "Mobile Number",
                          hintStyle: TextStyle(
                              color: TColor.placeholder, fontSize: 17)),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: const Color(0xffE2E2E2),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Or Connect with social media",
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundIconButton(
                  title: "Continue with google",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VerificationPage()));
                  },
                  icon: "assets/image/google_logo.png",
                  bgColor: const Color(0xff5383EC),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundIconButton(
                  title: "Continue with Facebook",
                  onPressed: () {},
                  icon: "assets/image/fb_logo.png",
                  bgColor: const Color(0xff4A66AC),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
