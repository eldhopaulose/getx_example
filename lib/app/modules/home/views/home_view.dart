import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
          future: controller.fetchData(), // Specify the future to be awaited.
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Text("loading"),
              );
            }
            if (snapshot.hasData) {
              final homeDetails = snapshot.data;
              return ListView.builder(
                itemCount: homeDetails?.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  final homeData = homeDetails?.data?[index];
                  return Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber,
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: ClipOval(
                            child: Image.network(
                              "${homeData?.avatar ?? ''}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "${homeData?.firstName ?? ''}  ${homeData?.lastName ?? ''}"),
                              Text("${homeData?.email ?? ''}"),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            } else {
              // Handle the case when data is null
              return const Center(
                child: Text('No data available'),
              );
            }

            // Handle the case when the data is available.
          }),
    );
  }
}
