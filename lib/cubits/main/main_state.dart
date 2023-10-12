part of 'main_cubit.dart';

@immutable
sealed class MainState {}

final class MainInitial extends MainState {}
////------------------------------------------

class GetPostsLoadingState extends MainState {}

class GetPostsSuccessState extends MainState {}

class GetPostsErrorState extends MainState {}

////------------------------------------------
