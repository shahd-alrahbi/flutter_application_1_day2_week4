import 'package:flutter/material.dart';
import 'package:flutter_application_1_day2/cubits/main/main_cubit.dart';
import 'package:flutter_application_1_day2/cubits/products/products_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = ProductsCubit.get(context);

    cubit.searchProducts = cubit.products;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBar(
              controller: controller,
              onChanged: (value) {
                cubit.search(value);
              },
              trailing: [
                IconButton(
                    onPressed: () {
                      cubit.search(controller.text);
                    },
                    icon: const Icon(Icons.search))
              ],
            ),
            BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                return cubit.searchProducts.isEmpty
                    ? const Center(child: Text("No items"))
                    : ListView.builder(
                        itemCount: cubit.searchProducts.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.network(
                              cubit.searchProducts[index].image!,
                            ),
                            title: Text(cubit.searchProducts[index].title!),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(cubit.searchProducts[index].category!),
                                Text(cubit.searchProducts[index].price!),
                              ],
                            ),
                          );
                        },
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
