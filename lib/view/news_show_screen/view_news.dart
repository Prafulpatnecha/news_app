import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/image_value.dart';
import '../../controller/news_controller.dart';

class ViewNews extends StatelessWidget {
  const ViewNews({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    double w= MediaQuery.of(context).size.width;
    double h= MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text("News BD"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: w,
                  height: 230,
                  decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(image: NetworkImage((newsController.apiOne!.value.articles[newsController.index.value].urlToImage==null)?newsImage:newsController.apiView!.value.articles[newsController.index.value].urlToImage,),fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(height: 30,width: 30,
                    decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(newsImage))),),
                    SizedBox(width: 10,),
                    Container(
                      child: Text(newsController.apiView!.value.articles[newsController.index.value].source.name ?? "BD News",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Spacer(),
                    Container(
                      child: Text(newsController.apiView!.value.articles[newsController.index.value].publishedAt ?? "BD News",style: TextStyle(fontSize: 10),),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      width: w*0.8,
                      child: Text(newsController.apiView!.value.articles[newsController.index.value].content ?? "BD News",textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text("Description",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: w,
                  child: Text(newsController.apiView!.value.articles[newsController.index.value].description ?? "BD News",style: TextStyle(),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
