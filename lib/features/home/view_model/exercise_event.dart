part of 'exercise_bloc.dart';

@immutable
abstract class ExerciseEvent {}

class GetExercise extends ExerciseEvent {
  final String? name;
  GetExercise({this.name});
}

class ChangeFilter extends ExerciseEvent {
  final ExerciseType? type;
  final ExerciseMuscle? muscle;
  ChangeFilter({this.type, this.muscle});
}
