import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:remember_app/domain/entity/Post.dart';

class ApiClient {
  final client = HttpClient();

  Future<List<Post>> getPosts() async {
    final json = await get('https://jsonplaceholder.typicode.com/posts')
        as List<dynamic>;

    final posts = json
        .map((dynamic e) => Post.fromJson(e as Map<String, dynamic>))
        .toList();
    return posts;
  }

  Future<dynamic> get(String ulr) async {
    final url = Uri.parse(ulr);
    final request = await client.getUrl(url);
    final response = await request.close();

    final jsonStrings = await response.transform(utf8.decoder).toList();
    final oneString = jsonStrings.join();
    final json = jsonDecode(oneString);
    return json;
  }
}
