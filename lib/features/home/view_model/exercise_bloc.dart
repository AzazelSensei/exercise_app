import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../constant/exercise_type_enum.dart';
import '../model/exercise_model.dart';
import '../service/exercise_service.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final ExerciseService exerciseService;
  ExerciseBloc(this.exerciseService) : super(ExerciseState()) {
    on<GetExercise>(
      _getExercise,
      transformer: (events, mapper) => events
          .debounceTime(const Duration(milliseconds: 300))
          .asyncExpand(mapper),
    );
    on<ChangeFilter>(
      _changeFilter,
    );
  }
  Future<void> _getExercise(
      GetExercise event, Emitter<ExerciseState> emit) async {
    emit(state.copyWith(status: ExerciseStatus.loading));
    try {
      final response = await exerciseService.getExercise(
        name: event.name,
        muscle: state.exerciseMuscle,
        type: state.exerciseType,
      );
      emit(state.copyWith(
        status: ExerciseStatus.loaded,
        exercises: response,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ExerciseStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  FutureOr<void> _changeFilter(
    ChangeFilter event,
    Emitter<ExerciseState> emit,
  ) {
    emit(ExerciseState(
      status: state.status,
      exercises: state.exercises,
      errorMessage: state.errorMessage,
      exerciseType: event.type,
      exerciseMuscle: event.muscle,
    ));
  }
}
