import 'package:autolibdz/Component/BottomNavigationBar.dart';
import 'package:autolibdz/Model/VehiculeModel.dart';
import 'package:flutter/material.dart';

import 'package:anim_search_bar/anim_search_bar.dart';

import '../Globals/Globals.dart';

class ListeCars extends StatefulWidget {
  @override
  _ListeCarsState createState() => _ListeCarsState();
}

class _ListeCarsState extends State<ListeCars> {
  List<Vehicule> listVehicules = <Vehicule>[];

  Future<void> initData() async {
    listVehicules = GlobalVarsSingleton().listVehicule;
  }

  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    initData();
    double long = MediaQuery.of(context).size.height;
    double larg = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBarComponent(1),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                width: 111.43,
                height: 97.63,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('img/logo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Row(
                children: [
                  FlatButton(
                    child: Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed("/homeS");
                    },
                  ),
                  Container(
                    child: Text("Liste des véhicules",
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: long * 0.035,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                  ),
                  Expanded(flex: 4, child: Container()),
                ],
              ),

              AnimSearchBar(
                width: 400,
                textController: textController,
                onSuffixTap: () {
                  setState(() {
                    textController.clear();
                  });
                },
              ),

              SizedBox(height: 20),

              Card(
                  color: const Color(0xffFFCB00),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text("véhicules",
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: long * 0.020,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                )),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text("Matricule",
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: long * 0.020,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                )),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text("Etat",
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: long * 0.020,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                )),
                          ),
                        ]),
                  )),
              //boucle des véhicules
              SizedBox(
                //
                height: 255,
                child: ListView.builder(
                  itemCount: listVehicules.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 70.43,
                                  height: 24.63,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(listVehicules[index].photourl),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Text(listVehicules[index].marque,
                                        style: TextStyle(
                                          fontFamily: 'Nunito',
                                          fontSize: long * 0.020,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        )),
                                    Text(listVehicules[index].modele,
                                        style: TextStyle(
                                          fontFamily: 'Nunito',
                                          fontSize: long * 0.020,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            Text(listVehicules[index].matricule.toString(),
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: long * 0.020,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                )),
                            Text(listVehicules[index].etat,
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: long * 0.017,
                                  fontWeight: FontWeight.w600,
                                  color: ((listVehicules[index].etat ==
                                              "en service") ||
                                          (listVehicules[index].etat ==
                                              "circulation"))
                                      ? Color(0xff2DCE89)
                                      : Color(0xfff41711),
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                width: double.infinity,
                child: RaisedButton(
                  elevation: 5,
                  onPressed: () {
                    Navigator.of(context).pushNamed("/car");
                  },
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  color: const Color(0xffFFCB00),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.map,
                        color: const Color(0xff212529),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Map',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          //height: 41,
                          color: const Color(0xff212529),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
