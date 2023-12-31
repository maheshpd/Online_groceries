import 'package:flutter/material.dart';
import 'package:oneline_grocery/common/color_extension.dart';
import 'package:oneline_grocery/common_widget/explore_cell.dart';
import 'package:oneline_grocery/data/data.dart';
import 'package:oneline_grocery/view/explore/explore_details_view.dart';
import 'package:oneline_grocery/view/explore/search_view.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  TextEditingController txtSearch = TextEditingController();

  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Find Products",
            style: TextStyle(
                color: TColor.primaryText,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchView()));
                },
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: const Color(0xffF2F3F2),
                      borderRadius: BorderRadius.circular(15)),
                  alignment: Alignment.center,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Image.asset(
                          "assets/image/search.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                      Text(
                        "Search Store",
                        style: TextStyle(
                            color: TColor.placeholder,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.95,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15),
                  itemCount: findProductArr.length,
                  itemBuilder: (context, index) {
                    var pObj = findProductArr[index] as Map? ?? {};
                    return ExploreCard(pObj: pObj, onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ExploreDetailView(eObj: pObj)));
                    });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
