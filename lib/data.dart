import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Images {
  int albumId = 1;
  int id = 1;
  String title = "accusamus beatae ad facilis cum similique qui sunt";
  String url = "https://via.placeholder.com/600/92c952";
  String thumbnailUrl = "https://via.placeholder.com/150/92c952";

  Images({required this.albumId, required this.id, required this.title, required this.url, required this.thumbnailUrl});

  Images.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }
}

class HttpClient{
  static Dio instance=Dio(BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com/'
  ));
}

Future<List<Images>> getPhoto() async{
  final response= await HttpClient.instance.get('photos');
  final List<Images> images=[];
  if (response.data is List<dynamic>){
    for (var element in (response.data as List<dynamic>)) { 
      images.add(Images.fromJson(element));
    }
  }
  return images;
}