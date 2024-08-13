import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

// image link -> https://graphicsfamily.com/wp-content/uploads/edd/2021/11/News-Logo-Template-Download-scaled.jpg

class ApiHelper {
  String linkOne="https://newsapi.org/v2/everything?q=apple&from=2024-08-12&to=2024-08-12&sortBy=popularity&apiKey=6ad5d62bae3f45d39b2868b0dac53759";
  String linkTwo="https://newsapi.org/v2/everything?q=tesla&from=2024-07-13&sortBy=publishedAt&apiKey=6ad5d62bae3f45d39b2868b0dac53759";
  String linkThree="https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=6ad5d62bae3f45d39b2868b0dac53759";
  String linkFour="https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=6ad5d62bae3f45d39b2868b0dac53759";
  String linkFive="https://newsapi.org/v2/everything?domains=wsj.com&apiKey=6ad5d62bae3f45d39b2868b0dac53759";
  Future<Map> apiCallingOne()
  async {
    Uri urlOne=Uri.parse(linkOne);
    Response responseOne=await http.get(urlOne);
    if(responseOne.statusCode==200)
      {
        final json=responseOne.body;
        final jsonData=jsonDecode(json);
        return jsonData;
      }else{
      return {};
    }
  }
  Future<Map> apiCallingTwo()
  async {
    Uri urlTwo=Uri.parse(linkTwo);
    Response responseTwo=await http.get(urlTwo);
    if(responseTwo.statusCode==200)
      {
        final json=responseTwo.body;
        final jsonData=jsonDecode(json);
        return jsonData;
      }else{
      return {};
    }
  }
  Future<Map> apiCallingThree()
  async {
    Uri urlThree=Uri.parse(linkThree);
    Response responseThree=await http.get(urlThree);
    if(responseThree.statusCode==200)
      {
        final json=responseThree.body;
        final jsonData=jsonDecode(json);
        return jsonData;
      }else{
      return {};
    }
  }
  Future<Map> apiCallingFour()
  async {
    Uri urlFour=Uri.parse(linkFour);
    Response responseFour=await http.get(urlFour);
    if(responseFour.statusCode==200)
      {
        final json=responseFour.body;
        final jsonData=jsonDecode(json);
        return jsonData;
      }else{
      return {};
    }
  }
  Future<Map> apiCallingFive()
  async {
    Uri urlFive=Uri.parse(linkFive);
    Response responseFive=await http.get(urlFive);
    if(responseFive.statusCode==200)
      {
        final json=responseFive.body;
        final jsonData=jsonDecode(json);
        return jsonData;
      }else{
      return {};
    }
  }
}
// link 1-> https://newsapi.org/v2/everything?q=apple&from=2024-08-12&to=2024-08-12&sortBy=popularity&apiKey=6ad5d62bae3f45d39b2868b0dac53759
// link 2-> https://newsapi.org/v2/everything?q=tesla&from=2024-07-13&sortBy=publishedAt&apiKey=6ad5d62bae3f45d39b2868b0dac53759
// link 3-> https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=6ad5d62bae3f45d39b2868b0dac53759
// link 4-> https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=6ad5d62bae3f45d39b2868b0dac53759
// link 5-> https://newsapi.org/v2/everything?domains=wsj.com&apiKey=6ad5d62bae3f45d39b2868b0dac53759