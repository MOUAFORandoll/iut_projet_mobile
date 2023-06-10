import 'package:Fahkap/components/Button/IconButtonF.dart';
import 'package:Fahkap/components/Button/btnCatList.dart';
import 'package:Fahkap/components/Button/btnCatListPV.dart';
import 'package:Fahkap/components/Button/button.dart';
import 'package:Fahkap/components/Form/formComponent2.dart';
import 'package:Fahkap/components/Text/bigText.dart';
import 'package:Fahkap/components/Text/bigtitleText0.dart';
import 'package:Fahkap/components/Widget/SalleComponent.dart';
import 'package:Fahkap/components/Widget/SalleComponent2.dart';
import 'package:Fahkap/controller/MyController.dart';
import 'package:Fahkap/styles/colorApp.dart';
import 'package:Fahkap/styles/textStyle.dart';
import 'package:Fahkap/utils/functions/viewFunctions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ListSalleBatiment extends StatelessWidget {
  ListSalleBatiment({required this.id});
  final id;
  ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyController>(builder: (_controller) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: InkWell(
              child: Icon(
                Icons.arrow_back_ios,
                color: ColorsApp.black,
              ),
              onTap: () {
                Get.back(closeOverlays: true);
              },
            ),
            title: BigtitleText0(text: 'Salles du batiment ', bolder: true),
          ),
          body: RefreshIndicator(
              color: ColorsApp.skyBlue,
              onRefresh: () async {
                await _controller.getListSalleBatiment(id);
              },
              child: _controller.isLoadedBatimentSalle == 0
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.blueAccent,
                      ),
                    )
                  : ListView.builder(
                      itemCount: _controller.SalleBatimentList.length,
                      itemBuilder: (_ctx, index) => SalleComponent2(
                            salle: _controller.SalleBatimentList[index],
                          ))
              // Builds 1000 ListTiles
              ));
    });
  }
}
