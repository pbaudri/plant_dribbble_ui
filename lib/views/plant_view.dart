import 'package:flutter/material.dart';
import 'package:plants_dribbble_ui/model/plant_model.dart';

class PlantView extends StatelessWidget {
  PlantView({Key? key}) : super(key: key);
  List<PlantData> plantData = [
    PlantData(value: 10, unit: "%", name: "Water tank"),
    PlantData(value: 98, unit: "%", name: "Light"),
    PlantData(value: 24, unit: "°C", name: "Temperature"),
    PlantData(value: 29, unit: "%", name: "Humidity"),
    PlantData(value: 89, unit: "%", name: "Fertilizer"),
    PlantData(value: 20, unit: "min", name: "Next watering"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Stack(
        children: [
          _plantImage(context),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "San pedro plant",
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Robust and elegant, \nwith long attractive leaves",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          height: 1.8,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  _dataPlant(),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 25,
                            ),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            Colors.white,
                          ),
                          elevation: MaterialStateProperty.all(2),
                        ),
                        child: const Text(
                          "Compare",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 25,
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            Colors.transparent,
                          ),
                          elevation: MaterialStateProperty.all(0),
                        ),
                        child: const Text(
                          "Next",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
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
    );
  }

  SizedBox _dataPlant() {
    return SizedBox(
      height: 250,
      width: 200,
      child: Stack(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 200 / 200,
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: plantData.length,
            itemBuilder: (BuildContext ctx, index) {
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plantData[index].value.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          plantData[index].unit,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    plantData[index].name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.white,
                      Colors.white.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Align _plantImage(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * .5,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/plant_home.png"),
              fit: BoxFit.contain),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const Padding(
        padding: EdgeInsets.only(left: 25),
        child: Icon(
          Icons.menu,
          color: Colors.black,
          size: 30,
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 25),
          child: Icon(
            Icons.more_horiz_outlined,
            color: Colors.black,
            size: 30,
          ),
        ),
      ],
    );
  }
}
