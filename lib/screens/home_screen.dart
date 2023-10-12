import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1_day2/cubits/main/main_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = MainCubit.get(context);
    cubit.getPosts();

    return Scaffold(
      appBar: AppBar(
        title: Text("Post"),
      ),
      body: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return state is GetPostsLoadingState
              ? const Center(child: CircularProgressIndicator())
              : state is GetPostsErrorState
                  ? const Center(child: Text("Please Try agin later"))
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.redAccent,
                              child: Text(cubit.posts[index].id.toString()),
                            ),
                            title: Text(cubit.posts[index].title!),
                            subtitle: Text(cubit.posts[index].body!),
                          ),
                        );
                      },
                      itemCount: cubit.posts.length,
                    );
        },
      ),
    );
  }
}
