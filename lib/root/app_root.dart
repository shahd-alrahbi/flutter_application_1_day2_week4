import 'package:flutter/material.dart';
import 'package:flutter_application_1_day2/cubits/main/main_cubit.dart';
import 'package:flutter_application_1_day2/cubits/products/products_cubit.dart';
import 'package:flutter_application_1_day2/screens/home_screen.dart';
import 'package:flutter_application_1_day2/screens/products_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MainCubit(),
          ),
          BlocProvider(create: (context) => ProductsCubit()),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ProductsScreen(),
        ));
  }
}
