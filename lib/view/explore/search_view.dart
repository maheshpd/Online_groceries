import 'package:flutter/material.dart';
import 'package:oneline_grocery/common/color_extension.dart';
import 'package:oneline_grocery/common_widget/producr_card.dart';
import 'package:oneline_grocery/data/data.dart';
import 'package:oneline_grocery/view/explore/filter_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController txtSearch = TextEditingController();

  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
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
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FilterView()));
              },
              icon: Image.asset(
                "assets/image/filter_ic.png",
                width: 20,
                height: 20,
              ),
            )
          ],
          title: Container(
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
                    suffixIcon: IconButton(onPressed: (){
                      txtSearch.text = "";
                      FocusScope.of(context).requestFocus(FocusNode());
                      setState(() {

                      });
                    }, icon: Image.asset(
                      "assets/image/t_close.png",
                      width: 15,
                      height: 15,
                    )),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "Search Store",
                    hintStyle: TextStyle(
                        color: TColor.placeholder,
                        fontSize: 14,
                        fontWeight: FontWeight.w600))),
          ),
        ),
        body: GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15),
            itemCount: searchArr.length,
            itemBuilder: (context, index) {
              var pObj = searchArr[index] as Map? ?? {};
              return ProductCard(pObj: pObj, onPressed: (){},weight: double.maxFinite,margin: 0,onCart: (){});
            }),
      ),
    );
  }
}
