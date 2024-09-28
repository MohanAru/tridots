import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tridotsapk/api/api.dart';
import 'package:tridotsapk/model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Map articles = {};
  NewsLog? res1;
  static String whole = "https://indiaretailing.go1cms.com/";
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    final response = await Repository().fetchNewsLog(
        "https://indiaretailing.go1cms.com/api/method/go1_cms.go1_cms.api.get_page_content_with_pagination?route=home&page_no=1&page_size=4");

    res1 = response;
    // http.get(Uri.parse(
    //     'https://indiaretailing.go1cms.com/api/method/go1_cms.go1_cms.api.get_page_content_with_pagination?route=home&page_no=1&page_size=4')); // Replace with your API endpoint

    // if (response.statusCode == 200) {
    //   final Map<String, dynamic> jsonData = json.decode(response.body);
    //   newsLogFromJson(response.body);
    // final Map articleData = jsonData["message"];

    //   // setState(() {
    //   //   articles = response.message.pageContent.data
    //   //   // print(
    //   //   //     "Data : ${articles["page_content"][0]["data"]["1700487376532"]["data"][0]['thumbnail_imagee']}");
    //   // });
    // } else {
    //   throw Exception('Failed to load articles');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          centerTitle: true,
          title: const Text("India Retaining"),
          actions: const [Icon(Icons.search)],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                padding: const EdgeInsets.all(2),
                // color: Colors.green,
                height: 55, // Set a height for the horizontal list
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  // res1!.message.pageContent.,
                  // articles["page_content"][0]["data"]["1700487376532"]["data"].length,
                  itemBuilder: (context, index) {
                    List itm = articles["page_content"][0]["data"]["1700487376532"]["data"];
                    print(" itemmmmmmmm1 : ${itm[index]['thumbnail_imagee']}");
                    // print(
                    //     "hksahkjdsa : ${articles["page_content"][0]["data"]["1700487376532"]["data"][index]['thumbnail_imagee']}");
                    // List corousel =
                    //     articles["page_content"][0]["data"]["1700487376532"]["data"];
                    return Card(
                      color: Colors.white,
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Row(
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                // color: Colors.red,
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.red,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "$whole${itm[index]['thumbnail_imagee'] ?? "/files/Screenshot 2023-11-21 134405_180x180.jpg"}" ??
                                          ""), // Update with a valid URL
                                ),
                              ),
                              // child: Image.network(
                              //     "https://indiaretailing.go1cms.com//files/Screenshot%202023-11-21%20134405.jpg"),
                            ),

                            const SizedBox(width: 8), // Add some space
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text(itm[index]['name']??"name"),
                                Text("Title"),
                                Text("Description Has Lies Here"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 88, 150, 207),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                      ),
                      const SizedBox(height: 8), // Add some space
                      const Text("Blog Order"),
                      const SizedBox(height: 8), // Add some space
                      // Your blog order items can be made into a separate widget if necessary
                      for (var i = 0; i < 3; i++) // Adjust the number of items as needed
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 65,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    color: Color.fromARGB(255, 202, 110, 104),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Tile"),
                                    Text("Description"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      // Latest News section
                      const Text(
                        "Latest News",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8), // Add some space
                      SizedBox(
                        height: 200, // Set a height for the horizontal list
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5, // Use your actual item count here
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(4),
                              child: Card(
                                color: Colors.white,
                                elevation: 2,
                                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.75,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(8),
                                          image: const DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              "https://indiaretailing.go1cms.com//files/Screenshot%202023-11-21%20134405.jpg", // Update with a valid URL
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8), // Add some space
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Title"),
                                            Text("Description Has Lies Here"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Big Billion Day Offer",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("Day Ends At the Parallel Day")
                          ],
                        ),
                      ),
                      const Divider(),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Big Billion Day Offer",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("Day Ends At the Parallel Day")
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("AdvertiseMent"),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5), color: Colors.blueGrey),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        decoration: BoxDecoration(color: Colors.green.withOpacity(0.1)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 250,
                              child: ListView.builder(
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius: BorderRadius.circular(5)),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("8 Retails Company"),
                                              Text("Condemn By Principle")
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "Web Specials",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.grey, borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return const Padding(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.rocket_launch),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("Cinema Industry Welcomes Lowest ")
                                    ],
                                  ),
                                  Divider()
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 180,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Container(
                                  //   width: MediaQuery.of(context).size.width * 0.75,
                                  //   height: 100,
                                  //   decoration: BoxDecoration(
                                  //       color: Colors.black26,
                                  //       borderRadius: BorderRadius.circular(5)),
                                  //   child: Image.network(
                                  //       "https://indiaretailing.go1cms.com//files/Screenshot%202023-11-21%20134405.jpg"),
                                  // ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.75,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.black26,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        "https://indiaretailing.go1cms.com//files/Screenshot%202023-11-21%20134405.jpg",
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return const Center(
                                              child: Text('Failed to load image',
                                                  style: TextStyle(color: Colors.red)));
                                        },
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Title Text Here",
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Content Here",
                                          style: TextStyle(fontSize: 15),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "Trending",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.symmetric(horizontal: 2),
                              decoration:
                                  BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey)),
                              child: const Center(child: Text("Rahul Gandhi in Manipur")),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Reaserch"),
                      ),

                      ///Bottom
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
