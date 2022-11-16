import 'package:dio/dio.dart';
import 'package:exercise_app/core/constant/api_constant.dart';
import 'package:exercise_app/features/home/service/exercise_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/home/view/home_view.dart';
import 'features/home/view_model/exercise_bloc.dart';

void main() {
  final dio = Dio(BaseOptions(
    baseUrl: ApiConstant.baseUrl,
  ));
  runApp(MyApp(dio: dio));
}

class MyApp extends StatelessWidget {
  final Dio dio;
  const MyApp({
    Key? key,
    required this.dio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExerciseBloc(ExerciseService(dio)),
      child: MaterialApp(
        title: 'Exercise App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const HomeView(),
      ),
    );
  }
}
