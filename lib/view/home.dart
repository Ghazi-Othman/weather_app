import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/homecontroller.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final contro = TextEditingController();
  String conv(int milis) {
    var x = milis * 1000;
    DateTime y = DateTime.fromMillisecondsSinceEpoch(x);
    String s = "${y.hour}:${y.minute}";
    return s;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return controller.weatherdata == null
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: contro,
                        onSubmitted: (value) =>
                            controller.changeCity(contro.text),
                      ),
                    ),
                    Container(
                      height: height / 3,
                      width: width,
                      margin: const EdgeInsets.all(10),
                      // padding: ,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(
                            "https://openweathermap.org/img/wn/${controller.weatherdata!.weather.first.icon}@2x.png",
                            loadingBuilder: (context, child, progress) {
                              return progress == null
                                  ? child
                                  : const CircularProgressIndicator(
                                      color: Colors.blue,
                                    );
                            },
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  controller.weatherdata!.name,
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  controller.weatherdata!.weather.first.main,
                                  style: const TextStyle(fontSize: 25),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  conv(controller.weatherdata!.dt),
                                  style: const TextStyle(fontSize: 25),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Temp : ",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            controller.weatherdata!.main.temp.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Max Temp : ",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            controller.weatherdata!.main.tempMax.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Min Temp : ",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            controller.weatherdata!.main.tempMin.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Humidity : ",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            controller.weatherdata!.main.humidity.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Wind Speed : ",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            controller.weatherdata!.wind.speed.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Sunrise : ",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            conv(controller.weatherdata!.sys.sunrise),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Sunset : ",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            conv(controller.weatherdata!.sys.sunset),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          controller.refsh();
                        },
                        icon: const Icon(
                          Icons.refresh,
                          size: 25,
                          color: Colors.blue,
                        ))
                  ],
                ));
        },
      ),
    );
  }
}
