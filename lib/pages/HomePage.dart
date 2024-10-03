import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Map<String, dynamic> res = {};
  String whole = 'https://indiaretailing.go1cms.com/';

  Future<Map<String, dynamic>> fetch() async {
    var response = await http.get(Uri.parse(
        "https://indiaretailing.go1cms.com/api/method/go1_cms.go1_cms.api.get_page_content_with_pagination?route=home&page_no=1&page_size=4"));
    if (response.statusCode == 200) {
      res = json.decode(response.body);
      print(" Response : $res");
      return res;
    }
    return {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.hasData) {
            var item =
                snapshot.data!['message']['page_content'][0]['data']['1700487376532']['data'];
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.grey.withOpacity(0.1),
                leading: const Icon(Icons.menu),
                centerTitle: true,
                title: const Text("India Retaining"),
                actions: const [Icon(Icons.search)],
              ),
              body: Container(
                color: Colors.grey.withOpacity(0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        height: 55, // Set a height for the horizontal list
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              snapshot
                                  .data!['message']['page_content'][0]['data']['1700487376532']
                                      ['data']
                                  .length,
                              (index) {
                                var data = snapshot.data!['message']['page_content'][0]['data']
                                    ['1700487376532']['data'][index];
                                return Card(
                                  color: Colors.white,
                                  elevation: 4,
                                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(4.0),
                                          child: Image.network(
                                            whole + data['thumbnail_imagee'],
                                            fit: BoxFit.cover,
                                            width: 50, // Set a width for the image
                                            height: 50, // Set a height for the image
                                          ),
                                        ),
                                        const SizedBox(width: 8), // Add some space
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 200, // Set max width to allow wrapping
                                              child: Text(
                                                data['name'],
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1, // Restrict name to one line
                                              ),
                                            ),
                                            Container(
                                              width: 200, // Set max width to allow wrapping
                                              child: Text(
                                                data['title'],
                                                style: const TextStyle(fontSize: 8),
                                                maxLines: 2, // Allow title to wrap up to 2 lines
                                              ),
                                            ),
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
                                      margin: const EdgeInsets.all(4),
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
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.blueGrey),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                // height: 250,
                                decoration: BoxDecoration(color: Colors.green.withOpacity(0.1)),
                                child: Column(
                                  children: List.generate(
                                    4,
                                    (index) {
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
                                                  Text(
                                                    "8 Retails Company",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold, fontSize: 15),
                                                  ),
                                                  Text("Condemn By Principle")
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),

                              // Container(
                              //   width: MediaQuery.of(context).size.width,
                              //   height: 250,
                              //   decoration: BoxDecoration(
                              //       color: Colors.green.withOpacity(0.1)),
                              //   child: Column(
                              //     children: [
                              //       SizedBox(
                              //         height: 250,
                              //         child: ListView.builder(
                              //           itemCount: 3,
                              //           itemBuilder: (context, index) {
                              //             return Padding(
                              //               padding: const EdgeInsets.all(5),
                              //               child: Row(
                              //                 mainAxisAlignment:
                              //                     MainAxisAlignment.start,
                              //                 crossAxisAlignment:
                              //                     CrossAxisAlignment.start,
                              //                 children: [
                              //                   Container(
                              //                     width: 100,
                              //                     height: 100,
                              //                     decoration: BoxDecoration(
                              //                         color: Colors.blue,
                              //                         borderRadius:
                              //                             BorderRadius.circular(
                              //                                 5)),
                              //                   ),
                              //                   const Padding(
                              //                     padding: EdgeInsets.all(5),
                              //                     child: Column(
                              //                       mainAxisAlignment:
                              //                           MainAxisAlignment.start,
                              //                       crossAxisAlignment:
                              //                           CrossAxisAlignment.start,
                              //                       children: [
                              //                         Text("8 Retails Company"),
                              //                         Text("Condemn By Principle")
                              //                       ],
                              //                     ),
                              //                   )
                              //                 ],
                              //               ),
                              //             );
                              //           },
                              //         ),
                              //       )
                              //     ],
                              //   ),
                              // ),
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

                              Column(
                                children: List.generate(
                                  4,
                                  (index) {
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
                              // SizedBox(
                              //   height: 150,
                              //   child: ListView.builder(
                              //     itemCount: 4,
                              //     itemBuilder: (context, index) {
                              //       return const Padding(
                              //         padding: EdgeInsets.all(5),
                              //         child: Column(
                              //           children: [
                              //             Row(
                              //               crossAxisAlignment:
                              //                   CrossAxisAlignment.start,
                              //               children: [
                              //                 Icon(Icons.rocket_launch),
                              //                 SizedBox(
                              //                   width: 5,
                              //                 ),
                              //                 Text(
                              //                     "Cinema Industry Welcomes Lowest ")
                              //               ],
                              //             ),
                              //             Divider()
                              //           ],
                              //         ),
                              //       );
                              //     },
                              //   ),
                              // ),
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
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 0.5, color: Colors.grey)),
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
          } else {
            return const Text("No data");
          }
        },
      ),
    );
  }
}
