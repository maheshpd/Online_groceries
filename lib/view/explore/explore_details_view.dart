import 'package:flutter/material.dart';
import 'package:oneline_grocery/common/color_extension.dart';
import 'package:oneline_grocery/common_widget/producr_card.dart';
import 'package:oneline_grocery/data/data.dart';
import 'package:oneline_grocery/view/explore/filter_view.dart';

class ExploreDetailView extends StatefulWidget {
  final Map eObj;
  const ExploreDetailView({super.key, required this.eObj});

  @override
  State<ExploreDetailView> createState() => _ExploreDetailViewState();
}

class _ExploreDetailViewState extends State<ExploreDetailView> {


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
          title: Text(
            widget.eObj["name"].toString(),
            style: TextStyle(
                color: TColor.primaryText,
                fontSize: 20,
                fontWeight: FontWeight.w700),
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
            itemCount: listArr.length,
            itemBuilder: (context, index) {
              var pObj = listArr[index] as Map? ?? {};
              return ProductCard(pObj: pObj, onPressed: (){},weight: double.maxFinite,margin: 0,onCart: (){});
            }),
      ),
    );
  }
}
