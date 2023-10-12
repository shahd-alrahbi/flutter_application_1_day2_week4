import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1_day2/models/post_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  static MainCubit get(context) => BlocProvider.of(context);

  List<PostModel> posts = [];

  Dio dio = Dio();

  void getPosts() {
    dio.get("https://jsonplaceholder.typicode.com/posts").then((value) {
      if (value.statusCode == 200) {
        for (var element in value.data) {
          posts.add(PostModel.fromJson(element));
        }
        emit(GetPostsSuccessState());
      } else {
        emit(GetPostsErrorState());
      }
    }).catchError((e) {
      print(e.toString());
      emit(GetPostsErrorState());
    });
  }
}
