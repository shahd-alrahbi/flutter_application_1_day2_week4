part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

//----------------------------------------------------------------------
class GetProductsLoadingState extends ProductsState {}

class GetProductsSuccessState extends ProductsState {}

class GetProductsErrorState extends ProductsState {}

class SearchProductsState extends ProductsState {}
