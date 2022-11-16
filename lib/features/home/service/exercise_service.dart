import 'package:dio/dio.dart';
import 'package:exercise_app/core/constant/api_constant.dart';
import 'package:exercise_app/features/home/constant/exercise_type_enum.dart';
import 'package:exercise_app/features/home/model/exercise_model.dart';

class ExerciseService {
  final Dio dio;

  ExerciseService(this.dio);

  Future<List<Exercise>> getExercise({
    String? name,
    ExerciseMuscle? muscle,
    ExerciseType? type,
  }) async {
    final response = await dio.get(
      ApiConstant.exerciseEndPoint,
      options: Options(
        headers: ApiConstant.apiKey,
      ),
      queryParameters: {
        'name': name ?? '',
        'muscle': muscle?.value ?? '',
        'type': type?.value ?? '',
      },
    );

    if (response.statusCode == 200) {
      return (response.data as List).map((e) => Exercise.fromJson(e)).toList();
    } else {
      throw response.statusCode.toString();
    }
  }
}
