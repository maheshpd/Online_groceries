import 'package:flutter/material.dart';
import 'package:oneline_grocery/common/color_extension.dart';
import 'package:oneline_grocery/common_widget/catagory_card.dart';
import 'package:oneline_grocery/common_widget/producr_card.dart';
import 'package:oneline_grocery/common_widget/section_view.dart';
import 'package:oneline_grocery/data/data.dart';
import 'package:oneline_grocery/view/home/product_details_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController txtSearch = TextEditingController();

  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/image/color_logo.png",
                      width: 25,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/image/location.png",
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Dhaka, Banassra",
                      style: TextStyle(
                          color: TColor.darkGray,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    height: 52,
                    decoration: BoxDecoration(
                        color: const Color(0xffF2F3F2),
                        borderRadius: BorderRadius.circular(15)),
                    alignment: Alignment.center,
                    child: TextField(
                        controller: txtSearch,
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 16),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Image.asset(
                                "assets/image/search.png",
                                width: 20,
                                height: 20,
                              ),
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "Search Store",
                            hintStyle: TextStyle(
                                color: TColor.placeholder,
                                fontSize: 14,
                                fontWeight: FontWeight.w600))),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                      width: double.maxFinite,
                      height: 115,
                      decoration: BoxDecoration(
                          color: const Color(0xffF2F3F2),
                          borderRadius: BorderRadius.circular(15)),
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/image/banner_top.png",
                        fit: BoxFit.fill,
                      )),
                ),
                SectionView(
                    title: "Exclusive Offer",
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    onPressed: () {}),
                SizedBox(
                  height: 230,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: exclusiveOfferArr.length,
                      itemBuilder: (context, index) {
                        var pObj = exclusiveOfferArr[index] as Map? ?? {};

                        return ProductCard(
                          pObj: pObj,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProductDetails()));
                          },
                          onCart: () {},
                        );
                      }),
                ),
                SectionView(
                    title: "Best Selling",
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    onPressed: () {}),
                SizedBox(
                  height: 230,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: exclusiveOfferArr.length,
                      itemBuilder: (context, index) {
                        var pObj = exclusiveOfferArr[index] as Map? ?? {};

                        return ProductCard(
                          pObj: pObj,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProductDetails()));
                          },
                          onCart: () {},
                        );
                      }),
                ),
                SectionView(
                    title: "Groceries",
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    onPressed: () {}),
                SizedBox(
                  height: 110,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: exclusiveOfferArr.length,
                      itemBuilder: (context, index) {
                        var pObj = exclusiveOfferArr[index] as Map? ?? {};

                        return CategoryCard(
                          pObj: pObj,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProductDetails()));
                          },
                        );
                      }),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 230,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: exclusiveOfferArr.length,
                      itemBuilder: (context, index) {
                        var pObj = exclusiveOfferArr[index] as Map? ?? {};

                        return ProductCard(
                          pObj: pObj,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProductDetails()));
                          },
                          onCart: () {},
                        );
                      }),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
