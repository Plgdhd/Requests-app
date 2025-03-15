import 'package:flutter/material.dart';
import 'package:remember_app/domain/entity/Post.dart';

class WidgetModel extends ChangeNotifier {
  var _post = <Post>[];
  List<Post> get posts => _post;
}
