import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/image_value.dart';
import '../../controller/news_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 45,
              ),
              buildRow(),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 25,
              ),
              buildRowWelcome(),
              const Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Discover a world of news that matters to you",
                    style: TextStyle(fontSize: 15, color: Colors.black38),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              buildGetBuilderSlider(newsController),
              SizedBox(
                height: 30,
              ),
              buildRowRecommendation(),
              SizedBox(
                height: 20,
              ),
              GetBuilder<NewsController>(
                builder: (controller) => FutureBuilder(
                  future: newsController.dataComesTwo(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      newsController.apiTwo = snapshot.data;
                      return Column(
                        children: [
                          ...List.generate(
                            newsController.apiTwo!.value.articles.length,
                            (index) {
                              return GestureDetector(
                                onTap: () {
                                  newsController.apiView = snapshot.data;
                                  newsController.index = index.obs;
                                  Get.toNamed('/view');
                                },
                                child: Card(
                                  color: Colors.white,
                                  child: Container(
                                    height: 130,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    (newsController
                                                                .apiTwo!
                                                                .value
                                                                .articles[index]
                                                                .urlToImage ==
                                                            null)
                                                        ? newsImage
                                                        : newsController
                                                            .apiTwo!
                                                            .value
                                                            .articles[index]
                                                            .urlToImage,
                                                  ),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 225,
                                                    child: Text(
                                                      newsController.apiTwo!.value
                                                          .articles[index].title ??
                                                          "News BD",
                                                      maxLines: 2,
                                                      overflow: TextOverflow.clip,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.bold,),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Spacer(),
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 20,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                            (newsImage),
                                                          ),
                                                          fit: BoxFit.cover),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    newsController.apiTwo!.value
                                                        .articles[index].source.name ??
                                                        "News BD",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildRowRecommendation() {
    return Row(
      children: [
        SizedBox(
          width: 5,
        ),
        Text(
          "Recommendation",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  GetBuilder<NewsController> buildGetBuilderSlider(
      NewsController newsController) {
    return GetBuilder<NewsController>(
      builder: (_) => Obx(
        () => FutureBuilder(
          future: newsController.dataComesOne(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              newsController.apiOne = snapshot.data;
              print(snapshot.data!.value.status);
              return CarouselSlider.builder(
                itemCount: newsController.apiOne!.value.articles.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return GestureDetector(
                    onTap: () {
                      newsController.apiView = snapshot.data;
                      newsController.index = index.obs;
                      Get.toNamed('/view');
                    },
                    child: Container(
                      // height: 100,
                      // width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage(
                              (newsController.apiOne!.value.articles[index]
                                          .urlToImage ==
                                      null)
                                  ? newsImage
                                  : newsController
                                      .apiOne!.value.articles[index].urlToImage,
                            ),
                            fit: BoxFit.cover),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 100,
                              color: Colors.white.withOpacity(0.2),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 300,
                                          child: Text(
                                            newsController.apiOne!.value
                                                    .articles[index].title ??
                                                "News BD",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  (newsImage),
                                                ),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          newsController.apiOne!.value
                                                  .articles[index].source.name ??
                                              "News BD",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                options:
                    CarouselOptions(autoPlay: true, enlargeCenterPage: true),
              );
              // Center(
              //   child: Obx(() => Text(newsController
              //           .apiModalTest!.value.articles[0].title ??
              //       "")));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Row buildRowWelcome() {
    return const Row(
      children: [
        SizedBox(
          width: 5,
        ),
        Text(
          "Welcome back, Tyler!",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Row buildRow() {
    return Row(
      children: [
        FloatingActionButton(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          onPressed: () {},
          child: const Icon(Icons.menu),
        ),
        const Spacer(),
        FloatingActionButton(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          onPressed: () {},
          child: const Icon(Icons.notifications_none_rounded),
        ),
      ],
    );
  }
}
