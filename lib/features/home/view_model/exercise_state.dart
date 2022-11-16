part of 'exercise_bloc.dart';

class ExerciseState {
  final List<Exercise> exercises;
  final String? errorMessage;
  final ExerciseStatus status;
  final ExerciseType? exerciseType;
  final ExerciseMuscle? exerciseMuscle;

  ExerciseState({
    this.exercises = const [],
    this.errorMessage,
    this.exerciseType,
    this.exerciseMuscle,
    this.status = ExerciseStatus.initial,
  });
  ExerciseState copyWith({
    List<Exercise>? exercises,
    String? errorMessage,
    ExerciseStatus? status,
    ExerciseType? exerciseType,
    ExerciseMuscle? exerciseMuscle,
  }) {
    return ExerciseState(
      exercises: exercises ?? this.exercises,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      exerciseType:
        exerciseType ?? this.exerciseType,
      exerciseMuscle: exerciseMuscle ?? this.exerciseMuscle,
    );
  }
}

enum ExerciseStatus {
  initial,
  loading,
  loaded,
  error,
}
