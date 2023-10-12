import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1_day2/models/post_model.dart';
import 'package:flutter_application_1_day2/models/product_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  static ProductsCubit get(context) => BlocProvider.of(context);

  List<ProductModel> products = [];

  List<ProductModel> searchProducts = [];

  void search(String text) {
    searchProducts = products
        .where((element) =>
            element.title!.toLowerCase().contains(text.toLowerCase()))
        .toList();

    emit(SearchProductsState());
  }

  Dio dio = Dio();

  void getProducts() {
    emit(GetProductsLoadingState());
    dio.get("https://fakestoreapi.com/products").then((value) {
      if (value.statusCode == 200) {
        for (var element in value.data) {
          products.add(ProductModel.fromJson(element));
        }

        emit(GetProductsSuccessState());
      }
    }).catchError((error) {
      print(error.toString());
      emit(GetProductsErrorState());
    });
  }
}
